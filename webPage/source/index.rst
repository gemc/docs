.. test documentation master file, created by
   sphinx-quickstart on Tue Dec 15 08:52:12 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

GEant4 Monte-Carlo
==================

gemc is an application based on `geant4 <https://geant4.cern.ch>`_  to simulate the passage of
particles through matters.
The user parameters (geometry, materials, fields, etc) are stored in databases
(available: MYSQL, ASCII). This makes it possible to build complex setup
that can be run in real time by all gemc users.

|

.. container:: mydiv


	.. thumbnail:: beam.png
		:width: 23%
		:group: mycenter
		:title:

		A 5T solenoid field aligns the beam of electrons along the z-axis.
		An addition tugnsten cone (blue) provides additional shielding to the
		CLAS12 detector from the beam high current. The GEMC simulation was used to design
		and validate the shielding.

	.. thumbnail:: clas12.png
		:width: 23%
		:group: mycenter
		:title:

		A Deep Virtual Compton Scattering (DVCS) event in the CLAS12 Central Detector.

	.. thumbnail:: eic.png
		:width: 23%
		:group: mycenter
		:title:

		The GEMC simulation of the Electron Ion Collider beamline and detectors.

	.. thumbnail:: bubble.png
		:width: 23%
		:group: mycenter	
		:title:

		10,000 electrons producing photons in the 6mm collimator in the bubble experiments at
 		Jefferson Lab.



Overview
========

gemc tries to make easy things easy and hard things possible.

Users can build a simulation with a few lines of code, with no required knowledge
of C++ or geant4 even for the most complex setup: the
definition of geometry, materials, output banks, etc is done by filling simple tables in the gemc API scripts.

The simulation parameters (geometry, fields, sensitivity, etc) so defined are stored
by the API in external databases (MYSQL or ASCII). GEMC can then read these databases and run the geant4 library.


At run time, options can be given to tilt objects, set conditions, etc.

.. image:: gemcAbstract.png
	:width: 80%
	:align: center

Any change in the model is reflected immediately in the databses, and can be tested by all gemc users w/o having
to re-compile code: the same gemc executable is used for many different experiments.





