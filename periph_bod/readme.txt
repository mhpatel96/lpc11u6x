LPC11u6x Brown-out detector example
===================================

Example description
-------------------
The brown-out example shows how to use the brown-out detector (BOD)
on the LPC11U6X. The BOD is setup to generate a BOD interrupt when
power is lost. The interrupt will attempt to toggle the LED on as
power is lost. If the board is powered up immediately after running
this program, the BOD reset status may still be active. If this
happens, the LED will immedaitely turn on to indicat this.

To use this example, build and program it and then run it on the board.
Power off the board by removing the power (USB) cable. As the power is
declining on the board, the LED will toggle on (quickly) and then turn
off as power is lost.

Special connection requirements
-------------------------------
There are no special connection requirements for this example.

