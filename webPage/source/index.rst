.. test documentation master file, created by
   sphinx-quickstart on Tue Dec 15 08:52:12 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

GEant4 Monte-Carlo
==================

gemc is an application based on `geant4 <https://geant4.cern.ch>`_  to simulate the passage of
particles through matter.
The main features of gemc are:

 * application independent geometry description
 * easy interface
 * cad/gdml imports

.. raw:: html
	<br>

.. container:: mydiv


	.. thumbnail:: beam.png
		:width: 20%
		:group: mycenter
		:title:

		A 5T solenoid field aligns the beam of electrons along the z-axis.
		An addition tugnsten cone (blue) provides additional shielding to the
		CLAS12 detector from the beam high current. The gemc simulation was used to design
		and validate the shielding.

	.. thumbnail:: eic_beam.png
		:width: 20%
		:group: mycenter
		:title:

		A Deep Virtual Compton Scattering (DVCS) event in the CLAS12 Central Detector.

	.. thumbnail:: eic.png
		:width: 35%
		:group: mycenter
		:title:

		The gemc simulation of the Electron Ion Collider beamline and detectors.

	.. thumbnail:: bubble.png
		:width: 20%
		:group: mycenter	
		:title:

		10,000 electrons producing photons in the 6mm collimator in the bubble experiments at
 		Jefferson Lab.

.. raw:: html

	<center><small> <i> From left to right:
    the clas12 electron beam in CLAS12;
    electron and ion beans in the EIC;
    the eic detector at interaction point
    the cebaf bubble experiment
   </i></small></center><br>




Overview
========

gemc makes easy things trivial and hard things possible.

Users can build and run complex setups with no C++ or geant4 knowledge. See for example :ref:`how to build a TOF with
few lines of code <simplePaddleExample>`.

The geometry and sensitivity is application independent. Users can load detectors using a combination several available factories:

 - MYSQL
 - TEXT
 - GDML
 - CAD
 - C++ Plugin

.. raw:: html

	<center>
	<script src="https://embed.github.com/view/3d/gemc/detectors/master/humanBody/Upper_GI.stl?width=250"></script>
	<script src="https://embed.github.com/view/3d/gemc/detectors/master/forFun/enterprise.stl?width=250"></script>
	<br>
	<small> <i> gemc can import models from CAD and GDML.
   </i></small></center><br><br>


The materials, digitization, electromagnetic fields, output format are application independent and customizable.

.. image:: gemcArchitecture.png
	:width: 90%
	:align: center

|




Open source
===========
Please visit the :ref:`contributing to gemc <contributingToGemc>` page if you're interested in the code development.

If you have any bug/code optimization to report, new ideas, features request, 
please feel free to `open a code issue / feature request <https://github.com/gemc/source/issues/new>`_ in github.


..
 Citing gemc
 ===========

