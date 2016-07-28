:orphan:

.. _ctofCade:

A time of flight detector from CAD
==================================

This example shows how to load a detector from CAD and associate to it attributes on the fly:

- make certain volumes sensitive
- associate volumes with a digitization routine.
- add visualization attributes to volumes
- set a material to volumes
- set the position of a volume
- set the rotation of a volume

A target and a solenoid are also added to the simulation.

Requirements
------------

- gemc 2.5 or newer
- `example tarball <https://gemc.jlab.org/gemc/html/documentation/tutorials/material/exampleCTOFCAD.tar>`_


How to run
----------

1. Unpack the tarball in a directory of your choice::

    tar -xpvf exampleCTOFCAD.tar

2. notice in the gcard how all cad files from a directory are loaded::

    <detector name="cad/" factory="CAD"/>

3. notice in "cad.gxml" how attributes are associated to cad files, including sensitivity and identifiers::

    <volume name="cad/sc28" color="444444" material="scintillator" position="0*mm 0*mm 1273.27*mm"
            rotation="0*deg 180*deg 0*deg" sensitivity="ctof" identifiers="paddle manual 28"/>

4. run gemc using the gcard provided:

    gemc ctof.gcard

5. Run some events and look at the signal GUI. You can select various quantities to display on screen.
   The digitization routine "ctof" (set in cad.gxml) is called for each sensitive paddle.

.. image:: ctofCad.png
	:width: 98%
	:align: center


