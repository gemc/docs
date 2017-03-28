
=======================
Simple Example  - *1/2*
=======================

This folder contains one of the simplest possible projects:  a simple material in a beam.
To make it slightly more interesting, the detector has been made sensitive, that is,
it will record hit information when a track passes through it.

The detector material is a pre-defined GEANT4 element “G4_Si” so there is no need to generate a materials file for gemc.


Pre-requisites
^^^^^^^^^^^^^^
Tarball containing the material for this tutorial: `myFirst.tar <https://gemc.jlab.org/gemc/html/documentation/tutorials/material/simple1.tar>`_.

To unpack::

 tar -xpvf simple1.tar

Sensitive Detector
^^^^^^^^^^^^^^^^^^

The sensitive detector is of the “flux” type which means that every track that passes through
will generate a hit.

The track parameters (energy deposited, time, position, etc.)
are integrated through all steps in the volume and presented as one hit per track,
based on the INTEGRATEDRAW=“flux” option in the gcard file.

The ‘flux’ type detector does not use a digitization factory to simulate the effects
of readout electronics on the output signal.

The geometry
^^^^^^^^^^^^

The simple "Tube" is defined in geometry.py::

 detector.type        = "Tube"
 detector.dimensions = "0.*cm 1.*cm 5.*mm 0*deg 360*deg"




|

.. image:: ../../next.png
	:target: 	simple1p2.html
	:align: right


