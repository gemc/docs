
##############
Voltage Output
##############

.. _voltageTime:


The response of a (real) detector is ultimately an electronic signal collected by an ADC or FADC [#]_ board
on a crate. This may include:

* cable length
* shape of the signal (rise and fall times)
* attenuation factors
* hardware delays
* etc

GEMC can provide a realistic output by using two user-customizable routines:

1) **chargeTime**: this provides signal as seen by the electronics.

   - In a scintillator coupled with a photo-multiplier (PMT) this could be charge pulses
     arriving at different times on the face of the PMTs.
   - In a cherenkov detector it could be charge pulses caused by photon bunches
     arriving at different times on the face of the PMTs.

2) **voltage**: this provides the shape of the voltage output.



The user implementation of these functions is detailed below.




.. _chargeTime:

chargeTime function
-------------------




.. _sampledOutput:

Sampled Output (FADC)
---------------------

The resulting voltage vs time function is automatically sampled by gemc and provided in the output.
Users can control the sampling time and the number of samples with the TSAMPLING option::

 -TSAMPLING="sampling time, total number of samples"

For example, -TSAMPLING="4, 250" provides 250 voltage points, 4 nanoseconds apart.

Flash ADC (FADC) are a modern alternative to ADC and provide a sampled voltage output.
With the voltage output mechanism, gemc effectively emulates FADC.




|

.. rubric:: Footnotes

.. [#] https://en.wikipedia.org/wiki/Flash_ADC


