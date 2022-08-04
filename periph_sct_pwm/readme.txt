LPC11u6x State Configurable Timer (SCT) PWM example
===================-===============================

Example description
-------------------
This example demonstrates how to use the SCT to create 3 simple independent
PWMs that use no CPU cycles or system bandwidth when it's running. The SCT is
configured to control the LED brightness on the board LEDs using the CTOUTn
outputs of the SCT. A single function will allow the brightness of the
LED to be changed by altering the SCT PWM timing.

See the comments in-code for detailed setup steps for the SCT.

Special connection requirements
-------------------------------
There are no special connection requirements for this example.

