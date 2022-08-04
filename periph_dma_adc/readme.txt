LPC11u6x ADC using DMA example
==============================

Example description
-------------------
This examples shows how to use the DMA controller to handle servicing
of the ADC channel(s) in burst mode. Althought the ADC doesn't have a
dedicated DMA channel, the DMA can be setup to service the ADC when the
ADC seqeuncer interrupt fires using a ADC sequencer A DMA trigger.

This specific example sets up the DMA to handle ADC sequencer interrupts
from one DMA channels using the linked descriptor list. The ADC sequencer
interrupt will not be used. The descriptor list is setup to handle 1 sample
per descriptor and place samples from a single ADC channel into 2 arrays.
Periodically, ADC data is averaged and displayed. A simple time based
benchmark is used to measure ADC sample rate.

This example provides a very basic and inefficient use of the DMA for
ADC data capture. It is recommended to use the DMA to capture multiple
ADC channels with the data registers to reduce DMA descriptor count
and processing.

Special connection requirements
-------------------------------
There are no special connection requirements for this example.


