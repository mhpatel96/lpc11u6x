LPC11u6x ADC example
====================

Example description
-------------------
The LPC11u6x ADC example shows how to use the ADC to perform
a sequence of conversions and monitor a threshold crossing. The
ADC is configured to monitor an input and is sampled by
manually starting the ADC sequence from the system tick interrupt.
The sequence then starts and generates an interrupt when complete.
During ADC sequence conversion, an interrupt will also be generated
if the sample read crosses the threshold 0 value.

To use this example, build and program it and then run it
on the board. Turn the potentiometer to change the ADC
signal input. Converted ADC values is displayed periodically via
the UART as kicked off by the ADC interrupt.

Special connection requirements
-------------------------------
The LPCXpresso base board is required with the LPCXpresso board to use this
example. The Manley board needs no extra hardware.


