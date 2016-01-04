Luminosity Generator
--------------------

To add background coming from the beam the following quantities must be defined

* a time window: the total time of one event
* the number of beam particles for each event
* the number of beam bunches

These quantities are defined with the *LUMI* options. For example the clas12 10\ :sup:`35` luminosity
on a 5cm LH\ :sub:`2` target is achieved with::

 <option name="LUMI_EVENT"     value="124000, 250*ns, 2*ns" />
 <option name="LUMI_P"         value="e-, 11*GeV, 0*deg, 0*deg" />
 <option name="LUMI_V"         value="(0.,0.,-10.)cm" />
 <option name="LUMI_SPREAD_V"  value="(0.01, 0.01)cm" />

Adds 124000 electrons in 250 ns time window, grouped in 2 ns bunches.
That would produce 125 bunches, with 992 particles each.
The beam is 100 micron wide and starts 10 cm upstream the CLAS center.

