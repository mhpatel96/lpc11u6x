/*
 * @brief I2C bus slave interrupt example using the ROM API
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

#include "board.h"

/*****************************************************************************
 * Private types/enumerations/variables
 ****************************************************************************/

/* I2C master handle and memory for ROM API */
static I2C_HANDLE_T *i2cHandleSlave;

/* Use a buffer size larger than the expected return value of
   i2c_get_mem_size() for the static I2C handle type */
static uint32_t i2cSlaveHandleMEM[0x20];

/** I2C addresses - in slave mode, only 7-bit addressing is supported */
/* NOTE: Since I2C uses the most-significant 7-bits of each byte-lane
   this address represents device 0x24. */
#define I2C_ADDR_7BIT               (0x00000048)

/** I2C mask - in slave mode, only 7-bit addressing is supported */
/* NOTE: This mask will only allow device 0x22. */
#define I2C_ADDR_7BIT_MASK  (0x00000000)

/* 1Mbps I2C bit-rate */
#define I2C_BITRATE                 (100000)

/* I2C read signal (and mask) */
#define I2C_READ_SIGNAL         (1)


/* Receive and transmit buffers */
static uint8_t recvBuff[16];

/* Global I2C ROM API parameter and results structures */
static I2C_PARAM_T param;
static I2C_RESULT_T result;
static void I2C_SetupXfer(void);

#define I2C_FASTPLUS_BIT    (0)

/*****************************************************************************
 * Public types/enumerations/variables
 ****************************************************************************/

/*****************************************************************************
 * Private functions
 ****************************************************************************/

/* Initializes pin muxing for I2C interface - note that SystemInit() may
   already setup your pin muxing at system startup */
static void Init_I2C_PinMux(void)
{
	Chip_SYSCTL_PeriphReset(RESET_I2C0);
#if defined(BOARD_MANLEY_11U68)
	Chip_IOCON_PinMuxSet(LPC_IOCON, 0, 4, IOCON_FUNC1 | I2C_FASTPLUS_BIT);
	Chip_IOCON_PinMuxSet(LPC_IOCON, 0, 5, IOCON_FUNC1 | I2C_FASTPLUS_BIT);

#elif defined(BOARD_NXP_LPCXPRESSO_11U68)
	Chip_IOCON_PinMuxSet(LPC_IOCON, 0, 4,
						 (IOCON_FUNC1 | I2C_FASTPLUS_BIT) | IOCON_DIGMODE_EN);
	Chip_IOCON_PinMuxSet(LPC_IOCON, 0, 5,
						 (IOCON_FUNC1 | I2C_FASTPLUS_BIT) | IOCON_DIGMODE_EN);
#else
#warning "No I2C Pin Muxing defined for this example"
#endif
}

/* Turn on LED to indicate an error */
static void errorI2C(void)
{
	Board_LED_Set(0, true);
	while (1) {__WFI();}
}

/* Setup I2C handle and parameters */
static void I2C_SetupSlaveMode()
{
	ErrorCode_t error_code;

	/* Enable I2C clock and reset I2C peripheral - the boot ROM does not
	   do this */
	Chip_I2C_Init(I2C0);

	/* Perform a sanity check on the storage allocation */
	if (LPC_I2CD_API->i2c_get_mem_size() > sizeof(i2cSlaveHandleMEM)) {
		/* Example only: this should never happen and probably isn't needed for
		   most I2C code. */
		errorI2C();
	}

	/* Setup the I2C handle */
	i2cHandleSlave = LPC_I2CD_API->i2c_setup(LPC_I2C0_BASE, i2cSlaveHandleMEM);
	if (i2cHandleSlave == NULL) {
		errorI2C();
	}

	/* Set a single 7-bit I2C address, only 7-bit addressing is supported */
	error_code = LPC_I2CD_API->i2c_set_slave_addr(i2cHandleSlave,
												  I2C_ADDR_7BIT, I2C_ADDR_7BIT_MASK);
	if (error_code != LPC_OK) {
		DEBUGOUT("Error setting I2C slave address\r\n");
		errorI2C();
	}

	/* No need to set I2C clock rate in slave mode */
}

/* I2C interrupt receive callback, called on completion of I2C 'read'
   operation when in interrupt mode. Called in interrupt context. */
static void I2C_XferComplete(uint32_t err_code, uint32_t n)
{
	I2C_SetupXfer();
}

/* Slave transmit in interrupt mode */
static void I2C_SetupXfer(void)
{
	ErrorCode_t rr;
	static uint8_t data;

	param.func_pt = I2C_XferComplete;
	if (result.n_bytes_recd >= 2) {
		data = recvBuff[result.n_bytes_recd - 1];
		Board_LED_Set(0, data);
	} else if (result.n_bytes_recd == 1 && (recvBuff[0] & 1)) {
		ErrorCode_t rt;
		param.num_bytes_send = 1;	/* Address byte */
		param.buffer_ptr_send = &data;
		rt = LPC_I2CD_API->i2c_slave_transmit_intr(i2cHandleSlave, &param, &result);
		result.n_bytes_sent = result.n_bytes_recd = 0;
		/* Completed without erors? */
		if (rt != LPC_OK) {
			DEBUGOUT("I2C TX/RX Setup Error : TX ERR = %x\r\n", rt);
			errorI2C();
		}
		return ;
	}

	/* Send 0 bytes based on master request */
	param.num_bytes_rec = 2;	/* Address byte */
	param.buffer_ptr_rec = &recvBuff[0];
	result.n_bytes_sent = result.n_bytes_recd = 0;

	/* Function is non-blocking */
	rr = LPC_I2CD_API->i2c_slave_receive_intr(i2cHandleSlave, &param, &result);

	/* Completed without erors? */
	if (rr != LPC_OK) {
		DEBUGOUT("I2C TX/RX Setup Error : RX ERR = %x\r\n", rr);
		errorI2C();
	}
}

/*****************************************************************************
 * Public functions
 ****************************************************************************/

/**
 * @brief	I2C interrupt handler
 * @return	Nothing
 */
void I2C0_IRQHandler(void)
{
	/* Call I2C ISR function in ROM with the I2C handle */
	LPC_I2CD_API->i2c_isr_handler(i2cHandleSlave);
}

/**
 * @brief	Main routine for I2C example
 * @return	Function should not exit
 */
int main(void)
{
	/* Generic Initialization */
	SystemCoreClockUpdate();
	Board_Init();

	/* Set initial LED state to off */
	Board_LED_Set(0, false);

	/* Setup I2C at the board level (usually pin muxing) */
	Init_I2C_PinMux();

	/* Allocate I2C handle, setup I2C rate, and initialize I2C
	   clocking */
	I2C_SetupSlaveMode();

	/* Enable the interrupt for the I2C */
	NVIC_EnableIRQ(I2C0_IRQn);

	/* Setup I2C receive slave mode - this will setup a
	   non-blocking I2C mode which will be handled via the I2C interrupt */
	I2C_SetupXfer();	/* From master first */

	/* I2C slave handler loop - wait for requests from master and
	   receive or send data in response */
	while (1) {
		/* Sleep while waiting for I2C master requests */
		__WFI();

		/* All I2C slave processing is performed in the I2C IRQ
		   handler, so there is nothing to really do here */
	}

	return 0;
}
