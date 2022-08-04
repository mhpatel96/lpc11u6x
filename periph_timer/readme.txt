LPC11u6x Simple timer example
=============================

Example description
-------------------
The Timer example uses 2 timers to blink 2 LEDs at different rates. The
timers are configured to generate interrupts upon expiration which is
when the LEDs are toggled. The first timer is a 32-bit timer set to expire
at 1-second (1Hz) intervals.  The second timer is a 16-bit timer used with a
prescale value to expire at .5-second (2Hz) intervals. The LED on/off state
should be slightly out of sync.

Special connection requirements
-------------------------------
There are no special connection requirements for this example.


