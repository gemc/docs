.. test documentation master file, created by
   sphinx-quickstart on Tue Dec 15 08:52:12 2015.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

GEant4 Monte-Carlo
==================

gemc is an application based on `geant4 <https://geant4.cern.ch>`_  to simulate the passage of
particles through matter. It provides:

 * application independent geometry description
 * easy interface to build / run experiments
 * cad/gdml imports


.. raw:: html

	<br>

.. container:: mydiv


	.. thumbnail:: beam.png
		:width: 19%
		:group: mycenter
		:title:

		A 5T solenoid field aligns the beam of electrons along the z-axis.
		An addition tugnsten cone (blue) provides additional shielding to the
		`CLAS12 <https://www.jlab.org/Hall-B/clas12-web/>`_ detector from the beam high current. The gemc simulation was used to design
		and validate the shielding.

	.. thumbnail:: eic_beam.png
		:width: 19%
		:group: mycenter
		:title:

		The electron and ion beamline and interation point detectors for the `electron-ion collider <https://www.jlab.org/meic/`_.

	.. thumbnail:: eic.png
		:width: 38%
		:group: mycenter
		:title:

		The gemc simulation of the Electron Ion Collider beamline and detectors.

	.. thumbnail:: bubble.png
		:width: 19%
		:group: mycenter	
		:title:

		10,000 electrons producing photons in the 6mm collimator in the bubble experiments at
 		Jefferson Lab.

.. raw:: html

	<center><small> <i> From left to right:
    the electron beam in the <a href="https://www.jlab.org/Hall-B/clas12-web/"> clas12</a> detector;
    electron and ion beans in the <a href="https://www.jlab.org/meic/"> electron-ion collider project</a>;
    the <a href="https://www.jlab.org/meic">electron-ion collider</a>  detector at interaction point;
    the <a href="https://wiki.jlab.org/ciswiki/index.php/Simulations_and_Backgrounds">cebaf bubble experiment </a>.
   </i></small></center><br>




Overview
========

gemc makes easy things trivial and hard things possible.

Users can build and run complex setups with minimal programming knowledge. See for example :ref:`how to build a TOF with
few lines of code <simplePaddleExample>`.

Experiments can be loaded  using a combination of several available factories:

 - MYSQL
 - TEXT
 - GDML
 - CAD (STL, PLY, OBJ formats)
 - C++ Plugin

.. raw:: html

	<center>
	<a href="https://github.com/gemc/detectors/blob/master/humanBody/Upper_GI.stl"><img src="_images/humanBody.png" width="400px" height="400px"></img></a>
	<a href="https://github.com/gemc/detectors/blob/master/forFun/enterprise.stl"> <img src="_images/forFun.png"    width="400px" height="400px"></img></a>
	<br>
   <small> <i> gemc can <a href="documentation/gdmlCadFactories.html">import models from CAD and GDML</a>.
   Left: the upper gastrointestinal system is modeled in CAD.
   It can be <a href="examples/humanBody.html">imported in GEMC and made it sensitive</a> so that radiation doses can be measured.
   Right: the mighty USS Enterprise NCC 1701-A <a href="examples/forFun.html">can be
   used to shoot protons torpedos</a>. These stl files are directly imported in GEMC.
   </i></small></center><br><br>


Simulations are application independent
=======================================

Once the user defined setup is loaded, it is translated in geant4. This includes:

- geometry
- materials
- mirrors
- physics list
- digitization
- electromagnetic fields

All particles are transported through matters and
produce radiation, hits, secondaries. The geant4 results are then collected and organized according to user preferences.



|

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

