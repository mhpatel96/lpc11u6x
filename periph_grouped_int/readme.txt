LPC11u6x Grouped GPIO Interrupt example
=======================================

Example description
-------------------
The Grouped GPIO interrupt example demonstrates the Grouped GPIO interrupt feature.

This example configures two Grouped GPIO interrupts.

Group GPIO interrupt 0 will be invoked when both the joystick up switch and left 
switch are pressed.
Grouped GPIO interrupt 1 will be invoked when both the joystick down switch and right 
switch are pressed.
The LED is turned on by GPIO interrupt 0 (up+left).
The LED is turned off by GPIO interrupt 1 (down+right).
The interrupts are programmed as edge triggered to prevent continuous interrupts while
the switches are pressed.

Special connection requirements
-------------------------------
The LPCXpresso base board is required with the LPCXpresso board to use this
example. The Manley board needs no extra hardware.

