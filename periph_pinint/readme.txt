LPC11u6x Pin Interrupt example
===============================

Example description
-------------------
The Pin interrupt example demonstrates using the pin interrupt API functions
pin interrupts & wake up from low power sleep state using the pin
interrupts.

This example configures the pin interrupt channel 7 as falling edge 
wake up interrupt. The interrupt channel 7 is connected to GPIO pin 
PIO0-0 in GPIO block. The example will go to sleep mode. To wake up from 
sleep mode, provide a falling edge pulse at GPIO pin PIO0-0. 
On the LPCXpresso board, PIO0-0 is connected to pontentiometer which 
can be used to provide falling edge pulse. The application will go to 
sleep state in a loop, with every wake up the board LED0 will be toggled.

Special connection requirements
-------------------------------
The LPCXpresso base board is required with the LPCXpresso board to use this
example. The Manley board needs no extra hardware.

