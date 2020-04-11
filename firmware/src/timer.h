
#ifndef MINIDRUM_TIMER_H
#define	MINIDRUM_TIMER_H

#include <stdint.h>

// Initialize Timer0 with 12.8 usec per tick (20 MHz / 256)
void TIMER_Initialize(void);

void TIMER_Suspend(void);

#define TIMER_Resume TIMER_Initialize

uint16_t TIMER_Get(void);

uint16_t TIMER_ElapsedSince(uint16_t ref_time);

#endif	/* MINIDRUM__H */

