/*
 * @brief RTC example with wakeup
 *
 * @note
 * Copyright(C) NXP Semiconductors, 2013
 * All rights reserved.
 *
 * @par
 * Software that is described herein is for illustrative purposes only
 * which provides customers with programming information regarding the
 * LPC products.  This software is supplied "AS IS" without any warranties of
 * any kind, and NXP Semiconductors and its licensor disclaim any and
 * all warranties, express or implied, including all implied warranties of
 * merchantability, fitness for a particular purpose and non-infringement of
 * intellectual property rights.  NXP Semiconductors assumes no responsibility
 * or liability for the use of the software, conveys no license or rights under any
 * patent, copyright, mask work right, or any other intellectual property rights in
 * or to any products. NXP Semiconductors reserves the right to make changes
 * in the software without notification. NXP Semiconductors also makes no
 * representation or warranty that such application will be suitable for the
 * specified use without further testing or modification.
 *
 * @par
 * Permission to use, copy, modify, and distribute this software and its
 * documentation is hereby granted, under NXP Semiconductors' and its
 * licensor's relevant copyrights in the software, without fee, provided that it
 * is used in conjunction with NXP Semiconductors microcontrollers.  This
 * copyright, permission, and disclaimer notice must appear in all copies of
 * this code.
 */

#include <stdlib.h>
#include <string.h>
#include "board.h"

/*****************************************************************************
 * Private types/enumerations/variables
 ****************************************************************************/

/* RTC interrupt flags */
static volatile bool rtcWake, rtcAlarm;

/*****************************************************************************
 * Public types/enumerations/variables
 ****************************************************************************/

/*****************************************************************************
 * Private functions
 ****************************************************************************/

/*****************************************************************************
 * Public functions
 ****************************************************************************/

/**
 * @brief	RTC Interrupt Handler
 * @return	None
 */
void RTC_IRQHandler(void)
{
	uint32_t rtcStatus;

	Board_LED_Toggle(0);

	/* Get RTC status register */
	rtcStatus = Chip_RTC_GetStatus(LPC_RTC);

	/* Check RTC 1KHz match interrupt */
	if (rtcStatus & RTC_CTRL_WAKE1KHZ) {
		/* RTC high resultiuon wakeup interrupt */
		rtcWake = true;
	}

	/* Check RTC 1Khz match interrupt */
	if (rtcStatus & RTC_CTRL_ALARM1HZ) {
		/* Alarm */
		rtcAlarm = true;
	}

	/* Clear only latched RTC status */
	Chip_RTC_EnableOptions(LPC_RTC,
						   (rtcStatus & (RTC_CTRL_WAKE1KHZ | RTC_CTRL_ALARM1HZ)));
}

/**
 * @brief	Main program body
 * @return	int
 */
int main(void)
{
	int stateCounter = 0;

	/* Setup SystemCoreClock and any needed board code */
	SystemCoreClockUpdate();
	Board_Init();

	/* Enable the RTC oscillator, oscillator rate can be determined by
	   calling Chip_Clock_GetRTCOscRate()	*/
	Chip_Clock_EnableRTCOsc();

	/* Initialize RTC driver (enables RTC clocking) */
	Chip_RTC_Init(LPC_RTC);

	/* RTC reset */
	Chip_RTC_Reset(LPC_RTC);

	/* Start RTC at a count of 0 when RTC is disabled. If the RTC is enabled, you
	   need to disable it before setting the initial RTC count. */
	Chip_RTC_Disable(LPC_RTC);
	Chip_RTC_SetCount(LPC_RTC, 0);

	/* Set a long alarm time so the interrupt won't trigger */
	Chip_RTC_SetAlarm(LPC_RTC, 1000);

	/* Enable RTC and high resolution timer - this can be done in a single
	   call with Chip_RTC_EnableOptions(LPC_RTC, (RTC_CTRL_RTC1KHZ_EN | RTC_CTRL_RTC_EN)); */
	Chip_RTC_Enable1KHZ(LPC_RTC);
	Chip_RTC_Enable(LPC_RTC);

	/* Clear latched RTC interrupt statuses */
	Chip_RTC_ClearStatus(LPC_RTC, (RTC_CTRL_OFD | RTC_CTRL_ALARM1HZ | RTC_CTRL_WAKE1KHZ));

	/* Enable RTC as a peripheral wakeup event */
	Chip_SYSCTL_EnablePeriphWakeup(SYSCTL_WAKEUP_RTCINT);

	/* Don't power down WDT (or BOD) during deep sleep. */
	Chip_SYSCTL_SetDeepSleepPD(0);

	/* Power everything up except for ADC, USB and temp sensor on wake up from
	   deep sleep. */
	Chip_SYSCTL_SetWakeup(SYSCTL_SLPWAKE_ADC_PD    |
						  SYSCTL_SLPWAKE_USBPLL_PD |
						  SYSCTL_SLPWAKE_USBPAD_PD |
						  SYSCTL_SLPWAKE_TS_PD
						  );

	/* Enable RTC interrupt */
	NVIC_EnableIRQ(RTC_IRQn);

	/* Enable RTC alarm interrupt */
	Chip_RTC_EnableWakeup(LPC_RTC, (RTC_CTRL_ALARMDPD_EN | RTC_CTRL_WAKEDPD_EN));

	/* Sleep and do all the work in the RTC interrupt handler */
	while (1) {
		DEBUGOUT("Tick number: %d, 1KHZ int:%d, alarm int:%d\r\n",
				 stateCounter, rtcWake, rtcAlarm);
		rtcWake = rtcAlarm = false;

		/* 10 high resolution ticks that get slower each tick */
		if (stateCounter < 10) {
			/* Wakeup in 300, 400, 500, etc. milliSeconds */
			Chip_RTC_SetWake(LPC_RTC, (300 + (stateCounter * 100)));

			stateCounter++;
		}
		else {	/* And 1 alarm tick with a small delay */
				/* Set alarm to wakeup in 3 seconds */
			Chip_RTC_SetAlarm(LPC_RTC, Chip_RTC_GetCount(LPC_RTC) + 4);

			stateCounter = 0;
		}

		/* Go to deep sleep state - will wake up automatically on interrupt */
		Chip_PMU_DeepSleepState(LPC_PMU);
	}

	return 0;
}
