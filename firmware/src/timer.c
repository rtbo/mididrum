#include "timer.h"

#include <xc.h>

void TIMER_Initialize()
{
    // Timer config:
    //  - enabled
    //  - 16 bit
    //  - internal TCY clock
    //  - 256 divider
    // at 20MHz, it makes a tick every 12.8 usec
    T0CON = 0x87;
}

void TIMER_Suspend()
{
    T0CON = 0;
}

uint16_t TIMER_Get()
{
    // reading low byte updates the high byte from buffer.
    // so we must first read the low byte
    uint8_t low = TMR0L;
    uint8_t high = TMR0H;
    return (((uint16_t) high) << 8) | low;
}

uint16_t TIMER_ElapsedSince(uint16_t ref_time)
{
    uint16_t time = TIMER_Get();
    if (time > ref_time) {
        return time - ref_time;
    }
    else {
        // overflow
        return 65535 - (ref_time - time);
    }
}
