LPC11u6x I2C bus master (polling) example using the ROM API
===========================================================

Example description
-------------------
This example shows how to configure I2C as a bus master in polling mode using
the ROM-based APIs.

This demo supports both 7-bit and 10-bit addressing, but only 7-bit addressing is
used in the example. After I2C is setup, the I2C master receive and transmit
functions are called through the built-in ROM routines.

For the Manley LPC11U68 board, the example reads the temperature sensor on the
Manley board. For the LPCXpresso LPC11U68 board, the examples communicates with
the IO expander to blink LEDs.

Special connection requirements
-------------------------------
The LPCXpresso base board is required with the LPCXpresso board to use this
example. The Manley board needs no extra hardware.


