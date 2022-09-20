Internal Generator
------------------

A primary particle 4-momentum and vertex ranges can be set with the gcard directives:

.. code-block:: bash

	<option name="BEAM_P"   value="proton, 4.0*GeV, 20.0*deg, 10*deg"/>
	<option name="SPREAD_P" value="1*GeV, 10*deg, 180*deg"/>
	<option name="BEAM_V"   value="(0, 0, -5)cm"/>
	<option name="SPREAD_V" value="(0.1, 10)cm"/>


The above will generate a proton with:

* momentum between 3 and 5 GeV.
* θ between 10 and 30 degrees.
* ϕ between 0 and 360 degrees.
* vertex z between -10 and 0 cm.
* vertex radius between 0 and 0.1 cm.

Any gcard directive can be superseed by its corresponding command line. For example::

 -BEAM_P="e-, 6.0*GeV, 20.0*deg, 10*deg"
 -SPREAD_P="1*GeV, 10*deg, 180*deg"


Particles names
---------------

Here's the list of some relevant particle names:

* e+
* e-
* eta
* gamma
* geantino
* kaon+
* kaon-
* kaon0
* kaon0L
* kaon0S
* mu+
* mu-
* neutron
* pi+
* pi-
* pi0
* proton


List of all particles
---------------------

The following line will print on screen the list of particles (name and ids) that can be used
by gemc::

 -BEAM_P=show_all



