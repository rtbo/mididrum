#ifndef MINIDRUM_IO_H
#define MINIDRUM_IO_H

#include <stdint.h>
#include <stdbool.h>

// Initialize the ADC and TTL input system
void IO_Initialize(void);

void IO_Suspend(void);

void IO_Resume(void);

enum {
    HIHAT_PEDAL_ADC,
    HIHAT_ADC,
    CRASH_ADC,
    SNARE_RIM_ADC,
    SNARE_ADC,
    TOM1_ADC,
    TOM2_ADC,
    TOM3_ADC,
    KICK_ADC,
    RIDE_ADC,

    NUM_ADC,
};

typedef uint8_t ADC;

// Start acquisition and AD conversion on the given channel
void IO_StartADC(ADC adc);

// Wait that acquisition and conversion is finished
void IO_WaitADC(void);

// Read the converted value (10 bits)
uint16_t IO_ReadADC(void);

enum {
    STATUS_ACTIVE_LED,
    STATUS_INACTIVE_LED,

    HIHAT_PEDAL_LED,
    HIHAT_LED,
    CRASH_LED,
    SNARE_RIM_LED,
    SNARE_LED,
    TOM1_LED,
    TOM2_LED,
    TOM3_LED,
    KICK_LED,
    RIDE_LED,

    NUM_LED,
};

typedef uint8_t LED;

void IO_LedSet(LED led, bool on);

#endif // MINIDRUM_IO_H
