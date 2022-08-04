LPC11u6x I2C bus slave (interrupt) example using the ROM API
============================================================

Example description
-------------------
This example shows how to configure I2C as a bus slave in interrupt mode using 
the ROM-based APIs.

This demo supports both 7-bit and 10-bit addressing, but only 7-bit addressing is
used in the example. After I2C is setup, the I2C receive and transmit functions
are called through the built-in ROM routines.<br<

This example won't work without a master hooked up to it. If a I2C bus master is
connected to it, it should ACK when it's I2C address is queried.

Special connection requirements
-------------------------------
IMOPRTANT NOTE:
This example requires a connection via I2C to a I2C master.

