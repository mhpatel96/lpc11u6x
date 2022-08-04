LPC11u6x SSP/SPI example
========================

Example description
-------------------
This example describes how to use SPI in POLLING or INTERRUPT  mode.
The LOOPBACK_TEST macro is used to enable Loop-back mode of SPI peripheral. It allows
a simple software testing. The transmit and receive data is connected together. No
more connection is required in this case.
If LOOPBACK_TEST macro is disabled, it is needed to connect 2 hardware boards,
one for Master and one for Slave. Use SSP_MODE_TEST macro to select the SPI mode.
SPI configuration:
- CPHA = 0: Data is sampled on the first clock edge of SCK.
- CPOL = 0: The rest state of the clock (between frames) is low.
- Sample rate = 100KHz.
- DSS = 8: 8 bits per transfer.
After initialize transmit buffer, SPI master/slave will transfer a number of bytes
to SPI slave/master and receive data concurrently.
When transferring completed, receive and transmit buffer will be compared. If they match,
the led is ON. If not the led is OFF.
This example supports 2 transfer modes: POLLING mode and INTERRUPT mode.

Special connection requirements
-------------------------------
There are no special connection requirements for this example.

