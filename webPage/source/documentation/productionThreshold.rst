.. _productionThreshold:

Production Cut
--------------

Every simulation developer must answer the questions:

- how low can you go?
- at what energy do I stop tracking particles?

This is a balancing act:

- need to go lowe enough to capture the physics of interest
- cannot go too low: some processes have infrared divergence

In *geant3* this balance was addressed by imposing an absolute cutoff in energy: particles are
stopped when this energy is reached, and the remaining energy is dumped at that point.

This leads to large inaccuracies in location: there is a particle type, momentum and material dependance of
the distance travelled by particles. A 10 KeV cutoff in lead is very different than a 10 KeV cutoff
in a scintillator.

Definition
==========

in *geant4* **the production cut is a distance**, not an energy:

- if secondaries can travel more than that distance, they are produced.
- otherwise there is discrete energy loss.

The location is now correct. Onlt one value of threshold is needed for all materials.

Example: 10mm vs 1mm vs 0.1mm
=============================

Let's consider a box of aluminum, an electron passing through it for 3 different production cut pcut:

- pcut=10mm: only secondary electrons of ~5 Mev or higher will be produced.
- pcut=1mm: only secondary electrons of ~700 ev or higher will be produced.
- pcut=0.1mm: only secondary electrons of ~150 ev or higher will be produced.

Depending on the e.m. physics list precision, pth=0.1mm could yield same resulsts as pcut=1mm:
if the threshold is smaller than free range path of a particle, lowering won't affect results.

.. figure:: prodThreshold.png
	:width: 90%
	:align: center

*Mean ranges of protons and electrons in aluminum [Source: E.J. Daly, A.Hilgers, G. Drolshagen, and H.D.R. Evans, "Space Environment Analysis: Experience and Trends,"
ESA 1996 Symposium on Environment Modelling for Space-based Applications, Sept. 18-20, 1996, ESTEC, Noordwijk, The Netherlands.]*


Setting a production cut for individual volumes
===============================================

It is possible and actually recommended to set up production cuts for certain passive volumes to speed up simulation.
Particles that will never make it to sensitive volumes do not need to be created, for example in shielding materials.

The option PRODUCTIONCUTFORVOLUMES allows user to specify a list of volumes and a production cut (in mm) for them. For example::

 -PRODUCTIONCUTFORVOLUMES="outerMount, taggerInnerShield, outerFlange, outerMount, main-cone, 100"

will set a 10cm cut for the volumes listed.

|


