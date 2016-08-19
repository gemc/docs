:orphan:

.. _roadmap:

############
GEMC Roadmap
############

.. image:: ../../GEMCRoadmap.png
	:width: 90%
	:align: center



GEMC 2.4 - June 2016 ✅
-----------------------

- Using new geant4 10.2. ✅

- Magnetic Field interpolations. ✅

- Field map attributes. ✅


- **Noise generator mechanism**: possibility to add custom noise/hot channels to detector response. ✅

- Option: by giving a volume name, change its material to a new material. ✅

- Option: by giving a material name, change all volume with that material to a material. ✅

- Neutrons cosmic ray model. ✅

- Option to force radiative decay of muons. ✅

- Remove sensitivity option. ✅



GEMC 2.5 - September 2016
-------------------------

- Gemc external Libraries ✅

- Remove more obsolete cpp materials.✅

- Accelerator Sync Bank ✅

- **Translation tables mechanism**: from detector identifier to crate/slot/channel. ✅

- gstring namespace library ✅

- **Custom V(t)**: ✅
   A user-defined **chargeTime** routine produces charge and time information
   for each geant4 step.

  A user-defined **voltage** function produces a voltage value for a given asked time

- Output format to match the composite banks of the JLab data acquisition group.

- GDML factory ✅

- CAD factory ✅

- Test Template for individual detectors.

- Add physical volume constructor - active rotations.


GEMC 2.6 - January 2017
-----------------------

- **G4Analysis tool** for all detectors fluxes.

- Physics Cross Section Validation at JLab regine. (Semi) Inclusive cross section.

- Finalize implementation of Replicas and Divisions.

- **Python API** implementation.

- Use Run Action.

- Add / Remove axis in GUI

- Linux Tarballs.


GEMC 2.7 - April 2017
---------------------

- **Digitization routines will be plugins**, stored with the detector definitions (geometry, materials, etc)
  - They will not be compiled in the gemc core anymore.
  - Constants mechanism will be handled in run action, no more in static call

- GEMC library for event generation. This will include plugins for different formats.

- Support for **proMC** format for event generation.

- Redesign Generator Tab

- Culling options combobox.

- Splash Screen library

- Pop up window for detector description


GEMC 2.8 - June 2017
--------------------

- Overimposing magnetic fields

- Multihit TDC

- Change identifier class to touchable.
  Have the vector<id> inside it, instead of passing vectors of identifier.

- Read Gzipped field maps

- API to sqlite

GEMC 3.0 - October 2017
-----------------------

- gemc 3.0 will make use of many **c++11** features and optimization.

- Option library - change options to make more sense.

- Re-define and document all verbosities.

- **Geant4 multithreading**.

- Match detector types to geant4.

- Touchable library: contains vector<identifier>. Optimize with no string operations?


GEMC 3.1 - January 2018
-----------------------

- Geant4 **parallel worlds**.

- Output format plugins.

- Geant4 output definitions will be an external GEMC library.

- Particles color map option.

- Geant4 scorers

GEMC 3.2 - April 2018
---------------------

- FASTMC mode. Simplified physics? Calorimeter parameterisation? Geant4 Bias?

- Benchmarking tools

- GEMC Nim A Paper

- GEMC on the mac app store





















