
#include <stdint.h>
#include <stdbool.h>

#include "io.h"
#include "timer.h"

#include "usb.h"
#include "usb_device_midi.h"

/* Some processors have a limited range of RAM addresses where the USB module
 * is able to access.  The following section is for those devices.  This section
 * assigns the buffers that need to be used by the USB module into those
 * specific areas.
 */

#if(__XC8_VERSION < 2000)
#    define DEVCE_AUDIO_MIDI_EVENT_DATA_BUFFER_ADDRESS   @0x500
#else
#    define DEVCE_AUDIO_MIDI_EVENT_DATA_BUFFER_ADDRESS   __at(0x500)
#endif

typedef union
{
    uint32_t val;
    uint8_t v[4];

    union
    {

        struct
        {
            uint8_t CIN : 4;
            uint8_t CN : 4;
            uint8_t MIDI_0;
            uint8_t MIDI_1;
            uint8_t MIDI_2;
        };

        struct
        {
            uint8_t status;
            uint8_t data0;
            uint8_t data1;
            uint8_t data2;
        };
    };
} MIDI_EVENT_PACKET;


// About 50mV expressed in 10 bit space,
#define MIN_NOTE_THRES 10

// hihat control is 5V if open, 4.5V is half, 2.5V if closed
#define HIHAT_SEMI_THRES 930
#define HIHAT_CLOSED_THRES 600 // need some margin for this one
#define HIHAT_MIN_CLOSE_TIME 7812
#define HIHAT_PEDAL_VEL_DIVIDER 62

#define VELOCITY(value) (value >> 3)

// 100 ms in timer ticks
#define TIME_NOTE_ON 7812

#define TOM1_PITCH 50
#define TOM2_PITCH 47
#define TOM3_PITCH 41
#define KICK_PITCH 35
#define RIDE_PITCH 51
#define SNARE_PITCH 38
#define SNARE_RIM_PITCH 37
#define CRASH_PITCH 49
#define HIHAT_OPEN_PITCH 46
#define HIHAT_CLOSED_PITCH 42
#define HIHAT_PEDAL_PITCH 44

typedef enum
{
    NOTE_OFF,
    NOTE_WAITING_PEAK,
    NOTE_ON,
} NOTE_STATE;

typedef enum
{
    PEDAL_POS_OPEN,
    PEDAL_POS_SEMI,
    PEDAL_POS_CLOSED,
} PEDAL_POS;

typedef struct
{
    uint8_t adc;
    uint8_t led;
    uint8_t pitch;
    uint8_t state;
    uint16_t timeOn;
    uint16_t value;
} PAD_NOTE;

// The regular pads are the ones without special handling.
// hit and send the corresponding note-on, followed by note-off

typedef enum
{
    TOM1_PAD,
    TOM2_PAD,
    TOM3_PAD,
    KICK_PAD,
    RIDE_PAD,

    NUM_REGULAR_PAD,
} REGULAR_PAD;

static PAD_NOTE regularPadNotes [NUM_REGULAR_PAD] = {
    {
        CRASH_ADC, CRASH_LED, RIDE_PITCH, 0, 0, 0,
    },
    {
        TOM1_ADC, TOM1_LED, TOM1_PITCH, 0, 0, 0,
    },
    {
        TOM2_ADC, TOM2_LED, TOM2_PITCH, 0, 0, 0,
    },
    {
        TOM3_ADC, TOM3_LED, TOM3_PITCH, 0, 0, 0,
    },
    {
        RIDE_ADC, RIDE_LED, RIDE_PITCH, 0, 0, 0,
    },
    {
        KICK_ADC, KICK_LED, KICK_PITCH, 0, 0, 0,
    },
};

static PAD_NOTE hihatPadNote = {
    HIHAT_ADC, HIHAT_LED, HIHAT_OPEN_PITCH, 0, 0, 0,
};
static PAD_NOTE hihatPedalNote = {
    HIHAT_PEDAL_ADC, HIHAT_PEDAL_LED, HIHAT_PEDAL_PITCH, 0, 0, 0,
};

static struct
{
    uint16_t lastTimeOpen;
    uint16_t timeOn;
    uint8_t pos;
    uint8_t state;
    bool rearmed;
} pedalState;

static enum
{
    KIT_INACTIVE,
    KIT_ACTIVE,
    KIT_SUSPENDED,
} kitState;


#define MAX_MIDI_EVENTS 16

static MIDI_EVENT_PACKET midiDataBuffer[MAX_MIDI_EVENTS] DEVCE_AUDIO_MIDI_EVENT_DATA_BUFFER_ADDRESS;

static uint8_t midiEvCount;

static USB_HANDLE USBTxHandle;

static uint16_t adcValues[NUM_ADC];

static bool SendNoteOn(uint8_t pitch, uint8_t vel)
{
    if (midiEvCount == MAX_MIDI_EVENTS) return false;

    MIDI_EVENT_PACKET *midiData = &midiDataBuffer[midiEvCount++];
    midiData->status = 0x90;
    midiData->data0 = pitch;
    midiData->data1 = vel;
    midiData->data2 = 0;
    return true;
}

static bool SendNoteOff(uint8_t pitch)
{
    if (midiEvCount == MAX_MIDI_EVENTS) return false;

    MIDI_EVENT_PACKET *midiData = &midiDataBuffer[midiEvCount++];
    midiData->status = 0x80;
    midiData->data0 = pitch;
    midiData->data1 = 0;
    midiData->data2 = 0;
    return true;
}

static void ReadPedalState()
{
    if (adcValues[HIHAT_PEDAL_ADC] > HIHAT_SEMI_THRES) {
        pedalState.pos = PEDAL_POS_OPEN;
        pedalState.lastTimeOpen = TIMER_Get();
        pedalState.rearmed = true;
    }
    else if (adcValues[HIHAT_PEDAL_ADC] > HIHAT_CLOSED_THRES) {
        pedalState.pos = PEDAL_POS_SEMI;
    }
    else {
        pedalState.pos = PEDAL_POS_CLOSED;
    }
}

static void HandleNote(PAD_NOTE *pn)
{
    uint16_t value = adcValues[pn->adc];
    if (pn->state == NOTE_OFF && value >= MIN_NOTE_THRES) {
        pn->value = value;
        pn->state = NOTE_WAITING_PEAK;
    }
    else if (pn->state == NOTE_WAITING_PEAK) {
        if (value > pn->value) {
            pn->value = value;
        }
        else if (SendNoteOn(pn->pitch, VELOCITY(pn->value))) {
            pn->timeOn = TIMER_Get();
            pn->state = NOTE_ON;
        }
    }
    else if (pn->state == NOTE_ON &&
             TIMER_ElapsedSince(pn->timeOn) >= TIME_NOTE_ON) {
        if (SendNoteOff(pn->pitch)) {
            pn->timeOn = TIMER_Get();
            pn->state = NOTE_ON;
        }
    }
}

static void HandleHihat()
{
    uint8_t lastPedalState = pedalState.state;
    ReadPedalState();
    if (hihatPadNote.state == NOTE_OFF) {
        // update pitch according to pedal and send pedal note if necessary
        if (pedalState.pos == PEDAL_POS_CLOSED) {
            hihatPadNote.pitch = HIHAT_CLOSED_PITCH;

            if (pedalState.rearmed) {
                uint16_t elapsed = TIMER_ElapsedSince(pedalState.lastTimeOpen);
                if (elapsed <= HIHAT_MIN_CLOSE_TIME) {
                    uint8_t vel = 127 - (elapsed / HIHAT_PEDAL_VEL_DIVIDER);
                    if (SendNoteOn(HIHAT_PEDAL_PITCH, vel)) {
                        pedalState.state = NOTE_ON;
                        pedalState.timeOn = TIMER_Get();
                        pedalState.rearmed = false;
                    }
                }
            }
        }
        else {
            hihatPadNote.pitch = HIHAT_OPEN_PITCH;
        }
    }
    HandleNote(&hihatPadNote);

    if (lastPedalState == NOTE_ON) {
        if (TIMER_ElapsedSince(pedalState.timeOn) >= TIME_NOTE_ON &&
            SendNoteOff(HIHAT_PEDAL_PITCH)) {
            pedalState.state = NOTE_OFF;
        }
    }

}

void DrumKit_Initialize()
{
    IO_Initialize();
    TIMER_Initialize();

    USBTxHandle = NULL;

    //enable the HID endpoint
    USBEnableEndpoint(USB_DEVICE_AUDIO_MIDI_ENDPOINT,
                      USB_OUT_ENABLED | USB_IN_ENABLED | USB_HANDSHAKE_ENABLED | USB_DISALLOW_SETUP);

    midiEvCount = 0;

    for (uint8_t c = 0; c < NUM_ADC; ++c) {
        IO_StartADC(c);
        IO_WaitADC();
        adcValues[c] = IO_ReadADC();
    }

    ReadPedalState();

    kitState = KIT_INACTIVE;
}

void DrumKit_Activate()
{
    kitState = KIT_ACTIVE;
}

void DrumKit_Suspend()
{
    IO_Suspend();
    TIMER_Suspend();
    kitState = KIT_SUSPENDED;
}

void DrumKit_Resume()
{
    IO_Resume();
    TIMER_Resume();
    kitState = KIT_ACTIVE;
}

void DrumKit_Tasks()
{
    if (kitState != KIT_ACTIVE) {
        return;
    }

    for (uint8_t c = 0; c < NUM_ADC; ++c) {
        IO_StartADC(c);
        IO_WaitADC();
        adcValues[c] = IO_ReadADC();
    }

    for (int i = 0; i < NUM_REGULAR_PAD; ++i) {
        HandleNote(&regularPadNotes[i]);
    }

    HandleHihat();

    if (midiEvCount > 0 && !USBHandleBusy(USBTxHandle)) {

        USBTxHandle = USBTxOnePacket(USB_DEVICE_AUDIO_MIDI_ENDPOINT,
                                     (uint8_t*) & midiDataBuffer[0],
                                     midiEvCount * sizeof (USB_AUDIO_MIDI_EVENT_PACKET));
        midiEvCount = 0;
    }
}
