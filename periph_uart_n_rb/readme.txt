LPC11u6x UARTs 1-4 example
==========================

Example description
-------------------
The UART example shows how to use the UART in interrupt mode with transmit
and receive ring buffers.  This example only applies to USARTs 1-4.

To use the example, connect a serial cable to the board's RS232/UART port and
start a terminal program to monitor the port.  The terminal program on the host
PC should be setup for 115200-8-N-1.
Once the example is started, a small message is printed on terminal. Any data
received will be returned back to the caller.

Special connection requirements
-------------------------------
The LPCXpresso base board is required with the LPCXpresso board to use this
example. The Manley board needs no extra hardware.

