
#include "io.h"

#include <xc.h>

void IO_Initialize()
{
    // set port directions
    // Port A: inputs from 0 to 3 and 5
    // Port B: inputs on 1, 2, 3 and 4
    // Port C and D are all outputs
    // Port E: inputs on 0, 1, 2
    TRISA = 0b00101111;
    TRISB = 0b00011110;
    TRISC = 0;
    TRISD = 0;
    TRISE = 0b00000111;

    // enable ADC
    ADCON0 = 0x01;

    // set AN0 to AN9 as analog inputs
    ADCON1 = 0b00000011;

    // Tad = 16 * Tosc (0.8 usecs)
    // Tacq = 2 * Tad (1.6 usecs)
    // Result is right-justified
    ADCON2 = 0x8d;
}

void IO_Suspend()
{
    ADCON0 = 0x00;
}

void IO_Resume()
{
    ADCON0 = 0x01;
}

void IO_StartADC(ADC adc)
{
    // select channel and set the GO bit to one
    ADCON0 = (adc << 2) | 0x03;
}

void IO_WaitADC()
{
    while (ADCON0bits.NOT_DONE) {
        Nop();
    }
}

uint16_t IO_ReadADC()
{
    return ((uint16_t) ADRESH) << 8 | ADRESL;
}

void IO_LedSet(LED led, bool on)
{
    switch (led) {
    case STATUS_INACTIVE_LED:
        LATAbits.LATA4 = on;
        break;
    case STATUS_ACTIVE_LED:
        LATBbits.LATB0 = on;
        break;
    case HIHAT_PEDAL_LED:
        LATBbits.LATB5 = on;
        break;
    case HIHAT_LED:
        LATCbits.LATC2 = on;
        break;
    case CRASH_LED:
        LATCbits.LATC6 = on;
        break;
    case SNARE_RIM_LED:
        LATDbits.LATD0 = on;
        break;
    case SNARE_LED:
        LATDbits.LATD1 = on;
        break;
    case TOM1_LED:
        LATDbits.LATD2 = on;
        break;
    case TOM2_LED:
        LATDbits.LATD3 = on;
        break;
    case TOM3_LED:
        LATDbits.LATD4 = on;
        break;
    case KICK_LED:
        LATDbits.LATD5 = on;
        break;
    case RIDE_LED:
        LATDbits.LATD6 = on;
        break;
    }
}
