LPC11U6x Switch blinky demo
===========================

Example description
-------------------
This project demonstrates the use of LEDs and user switches. The LEDs are the RGB 
tri-color LED on the LPCXpresso LPC11U68 board and LD2, LD3 and LD4 on the Manley 
LPC11U68 board.  The user switches are SW1 and SW2 on the LPCXpresso11U68 board
and B2 and B3 on the Manley).

When this demo begins to execute, the LEDs will toggle on/off in turn, based on
the Systick timer.

Pressing SW2/B2 will cause the application to pause for 1 second then start 
blinking just the first LED (RED/LD2) based on RTC (real time clock).

Pressing SW1/B3 will switch the mode of operation back to cycling through all 
three LEDs.

Special connection requirements
-------------------------------
There are no special connection requirements for this example.

