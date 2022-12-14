/*
 * @brief UART interrupt example with ring buffers
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

#include "chip.h"
#include "board.h"
#include "string.h"

/*****************************************************************************
 * Private types/enumerations/variables
 ****************************************************************************/

/* Enable this define to use integer clocking instead of the fractional baud
   rate generator */
// #define USE_INTEGER_CLOCK

/* Transmit and receive ring buffers */
STATIC RINGBUFF_T txring, rxring;

/* Ring buffer size */
#define UART_RB_SIZE 64

/* Set the default UART, IRQ number, and IRQ handler name */
#if defined(BOARD_MANLEY_11U68)
#define LPC_USART       LPC_USART1
#define LPC_IRQNUM      USART1_4_IRQn
#define LPC_UARTHNDLR   USART1_4_IRQHandler

#elif defined(BOARD_NXP_LPCXPRESSO_11U68)
#define LPC_USART       LPC_USART1
#define LPC_IRQNUM      USART1_4_IRQn
#define LPC_UARTHNDLR   USART1_4_IRQHandler

#else
/* Configure your own UART pin muxing here if needed */
#error "No UART setup defined"
#endif

/* Default baudrate for testing */
#define UART_TEST_DEFAULT_BAUDRATE 115200

/* Transmit and receive buffers */
static uint8_t rxbuff[UART_RB_SIZE], txbuff[UART_RB_SIZE];

const char inst1[] = "LPC11u6x UART example using ring buffers\r\n";
const char inst2[] = "Press a key to echo it back or ESC to quit\r\n";

/*****************************************************************************
 * Public types/enumerations/variables
 ****************************************************************************/

/*****************************************************************************
 * Private functions
 ****************************************************************************/

/* UART Pin mux function - note that SystemInit() may already setup your
   pin muxing at system startup */
static void Init_UARTN_PinMux(void)
{
#if defined(BOARD_MANLEY_11U68)
	/* UART signals on pins PIO0_14 (FUNC4, U1_TXD) and PIO0_13 (FUNC4, U1_RXD) */
	Chip_IOCON_PinMuxSet(LPC_IOCON, 0, 14, (IOCON_FUNC4 | IOCON_MODE_INACT | IOCON_DIGMODE_EN));
	Chip_IOCON_PinMuxSet(LPC_IOCON, 0, 13, (IOCON_FUNC4 | IOCON_MODE_INACT | IOCON_DIGMODE_EN));

#elif defined(BOARD_NXP_LPCXPRESSO_11U68)

	/* UART signals on pins PIO0_14 (FUNC4, U1_TXD) and PIO0_13 (FUNC4, U1_RXD) */
	Chip_IOCON_PinMuxSet(LPC_IOCON, 0, 14, (IOCON_FUNC4 | IOCON_MODE_INACT | IOCON_DIGMODE_EN));
	Chip_IOCON_PinMuxSet(LPC_IOCON, 0, 13, (IOCON_FUNC4 | IOCON_MODE_INACT | IOCON_DIGMODE_EN));

#else
#warning "No UART pins configured.  Example may not run correctly"
#endif
}

/*****************************************************************************
 * Public functions
 ****************************************************************************/

/**
 * @brief	UART interrupt handler using ring buffers
 * @return	Nothing
 */
void LPC_UARTHNDLR(void)
{
	/* Want to handle any errors? Do it here. */

	/* Use default ring buffer handler. Override this with your own
	   code if you need more capability. */
	Chip_UARTN_IRQRBHandler(LPC_USART, &rxring, &txring);
}

/**
 * @brief	Main UART program body
 * @return	Always returns 1
 */
int main(void)
{
	uint8_t key;
	int bytes;

	SystemCoreClockUpdate();
	Board_Init();
	Init_UARTN_PinMux();
	Board_LED_Set(0, false);

	/* Before setting up the UART, the global UART clock for USARTS 1-4
	   must first be setup. This requires setting the UART divider and
	   the UART base clock rate to 16x the maximum UART rate for all
	   UARTs. */
#if defined(USE_INTEGER_CLOCK)
	/* Use 256x expected UART baud rate for integer mode to reduce
	   the clock error at higher baud rates. */
	Chip_Clock_SetUSARTNBaseClockRate((115200 * 256), false);

#else
	/* Use 48x expected UART baud rate for fractional baud mode. (Lower limit
	   is 16x.) */
	Chip_Clock_SetUSARTNBaseClockRate((115200 * 48), true);
#endif

	/* Setup UART */
	Chip_UARTN_Init(LPC_USART);
	Chip_UARTN_ConfigData(LPC_USART, UARTN_CFG_DATALEN_8 | UARTN_CFG_PARITY_NONE | UARTN_CFG_STOPLEN_1);
	Chip_UARTN_SetBaud(LPC_USART, UART_TEST_DEFAULT_BAUDRATE);

	/* Optional for low clock rates only: Chip_UARTN_SetBaudWithRTC32K(LPC_USART, 300); */
	Chip_UARTN_Enable(LPC_USART);
	Chip_UARTN_TXEnable(LPC_USART);

	/* Before using the ring buffers, initialize them using the ring
	   buffer init function */
	RingBuffer_Init(&rxring, rxbuff, 1, UART_RB_SIZE);
	RingBuffer_Init(&txring, txbuff, 1, UART_RB_SIZE);

	/* Enable receive data and line status interrupt */
	Chip_UARTN_IntEnable(LPC_USART, UARTN_INTEN_RXRDY);
	Chip_UARTN_IntDisable(LPC_USART, UARTN_INTEN_TXRDY);	/* May not be needed */

	/* Enable UART interrupt */
	NVIC_EnableIRQ(LPC_IRQNUM);

	/* Initial message sent using blocking method to prevent ring
	   buffer overflow */
	Chip_UARTN_SendBlocking(LPC_USART, inst1, sizeof(inst1) - 1);
	Chip_UARTN_SendRB(LPC_USART, &txring, inst2, sizeof(inst2) - 1);

	/* Poll the receive ring buffer for the ESC (ASCII 27) key */
	key = 0;
	while (key != 27) {
		bytes = Chip_UARTN_ReadRB(LPC_USART, &rxring, &key, 1);
		if (bytes > 0) {
			/* Wrap value back around */
			if (Chip_UARTN_SendRB(LPC_USART, &txring, (const uint8_t *) &key, 1) != 1) {
				Board_LED_Toggle(0);/* Toggle LED if the TX FIFO is full */
			}
		}
	}

	/* DeInitialize UART peripheral */
	NVIC_DisableIRQ(LPC_IRQNUM);
	Chip_UARTN_DeInit(LPC_USART);

	return 1;
}
