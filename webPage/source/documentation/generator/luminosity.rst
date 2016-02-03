Luminosity Generator
--------------------

To add background coming from the beam the following quantities must be defined

* a time window: the total time of one event
* the number of beam particles for each event
* the number of beam bunches

These quantities are defined with the *LUMI* options. For example the clas12 10\ :sup:`35` luminosity
on a 5cm LH\ :sub:`2` target is achieved with:

.. code-block:: bash

	<option name="LUMI_EVENT"     value="124000, 250*ns, 2*ns" />
	<option name="LUMI_P"         value="e-, 11*GeV, 0*deg, 0*deg" />
	<option name="LUMI_V"         value="(0.,0.,-10.)cm" />
	<option name="LUMI_SPREAD_V"  value="(0.01, 0.01)cm" />

The above directives add 124000 electrons in a 250 ns long event, grouped in 2 ns bunches.
That means produce 125 bunches, with 992 particles each.
The beam is 100 micron wide (*LUMI_SPREAD_V*) and starts 10 cm upstream the CLAS center (*LUMI_V*).

