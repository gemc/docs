
########
GEMC Hit
########


Hit Definition
--------------

The definition of a hit is tied up to the detector electronics, in particular its Time Window (TW), defined by the user.

All geant4 steps [#]_ in a detector element [#]_ within the TW constitute a hit.

Example
-------

Shown in Fig. 1 is a schematic
of two tracks and secondaries hitting two detector elements to better illustrate the hit definition. In particular:

* Track 1 has 3 (blue) steps in the first red cell and one (purple) step in the second yellow cell.
* Track 1 also has two secondaries; the first one has one step in the red cell and the second one has two steps, one in each cell.
* Track 2 has 2 steps in each cell, within the TW of the previous steps. So its steps do not create new hits, but add to the previous
  hits' steps.
* All the blue steps happens within the detector TW: they constitute one hit.
* All the purple steps happens within the detector TW: they constitute one hit.
* In total, we have two hits. Notice that if the second track was out of the TW, it would generate two additional hits, with two steps each
  in each cell.




.. figure:: hitDefinition.gif
   :width: 90%
   :align: center

   Figure 1: the first track generate two hits. The second track is within the TW of the first one, so it does not generate additional hits and
   its steps add to the previous hits’ steps.


True Information
----------------






Process Names / ID Table
------------------------

   =====================  =========
   Process Name           ID (int)
   ---------------------  ---------
   e ionization              1
   compton scattering        2
   e bremsstrahlung          3
   Photo Electric Effect     4
   Gamma Conversion          5
   e+ Annihilation           6
   photon-Nuclear            7
   electron-Nuclear          8
   Hadronic Elastic          9
   Proton Inelast ic         10
   Neutron Inelastic         11
   pi- Inelastic             12
   pi+ Inelastic             13
   hadron ionization         14
   neutron capture           15
   decay                     16
   muon ionization           17
   Coulomb Scattering        18
   na                        90
   =====================  =========



|

.. rubric:: Footnotes

.. [#] Geant4 determines the size of a step, and the energy deposited, based on particle type, momentum,
       material type and density, and physics processes cross sections.
       In GEMC users can limit the maximum step for a given detector.
.. [#] A detector element is its smallest readout. For example, a wire in Drift Chambers, or a strip in a silicon vertex.


