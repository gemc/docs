
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


The users also need to provide a translation table to relate the volume identifier to the electronic
address (crate/slot/channel).

The user implementation of these functions is detailed below.




.. _chargeTime:

chargeTime function
-------------------

The input to this function is the hit information, including energy deposited and time of every step in the hit.

The output is a map of arrays::

 CT = map< int, vector <double> >

The users collect information from the various steps of the hits, and provide
a collection of charges, each with its time, identifier and hardware address (crate, slot, channel):

- CT[1]: chargeIndex
- CT[2]: chargeAtElectronics
- CT[3]: timeAtElectronics
- CT[4]: identifiers
- CT[5]: hardware


*Example*:

A scintillator paddle, identified by SECTOR=3, PANEL=1, PADDLE=15 is hit.
The paddle correspond to the hardware address (crate, slot, channel) = (19, 3, 14).

The hit has 10 geant4 steps. These are collected in two charges.

The corresponding map will look like something like this:

- CT[1]: {0, 1}  (index of the two charges)
- CT[2]: {0.333, 0.89}  (the two charge values)
- CT[3]: {22.45, 30.22} (the two charge times)
- CT[4]: {3, 1, 15} (hit identifier, sector panel paddle)
- CT[5]: {19, 3, 14} (hardware identifier, crate slot channel)

CT[0] must be filled with the hit number.



.. _voltageTimeFunction:

Voltage function
----------------

This function is used to provide GEMC with the voltage as a function of T. The input of this function are
a charge, and time when that charge arrives at the electronics.

This function effectively provides, see Figure 1 below, the response of the electronic to a charge amount: the shape of the signal as a function of time.

|

.. figure:: voltageTime.png
   :width: 90%
   :align: center

   *Figure 1: the user provide a customized V(t) function, given the input Q (charge) and its time at the electronics*


GEMC provides a built in function very similar to the one in Figure 1.
It is called **DGauss** and can be tuned with a vector of parameters. Below is one example.

 - par[0] = 50;  // delay, ns
 - par[1] = 10;  // rise time, ns
 - par[2] = 20;  // fall time, ns
 - par[3] = 1;   // amplifier, charge to time

DGauss can be used directly in the Voltage function::


 double ec_HitProcess :: voltage(double charge, double time, double forTime) {
		return DGauss(forTime, ecc.vpar, charge, time);
 }


A complete chargeTime and voltage functions example can be found in
the `CLAS12 Calorimeter digitization <https://github.com/gemc/source/blob/master/hitprocess/clas12/ec_hitprocess.cc>`_.


.. _sampledOutput:

Sampled Output (FADC)
---------------------

Once **chargeTime** and **voltage** have been implemented, the resulting voltage vs time response of a detector
is automatically sampled by gemc and provided in the output.

Users can control the sampling time and the number of samples with the TSAMPLING option::

 -TSAMPLING="sampling time, total number of samples"

For example, -TSAMPLING="4, 250" provides 250 voltage points, 4 nanoseconds apart.

Flash ADC (FADC) are a modern alternative to ADC and provide a sampled voltage output.
With the voltage output mechanism, gemc effectively emulates FADC.




|

.. rubric:: Footnotes

.. [#] https://en.wikipedia.org/wiki/Flash_ADC


