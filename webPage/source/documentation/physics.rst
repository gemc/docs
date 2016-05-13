:orphan:

.. _gemcPhysics:

#######
Physics
#######


The electromagnetic, hadronic and optical physics process can be individually activated using the PHYSICS option.
For example::

 <option name="PHYSICS" value="FTFP_BERT + STD + Optical"/>

will activate the hadronic list FTFP_BERT, the standard electromagnetic process and also the optical physics.
The order in the list is irrelevant.


Electromagnetic Processes
-------------------------

The EM physics processes included in geant4 `are <http://geant4.cern.ch/support/proc_mod_catalog/processes/>`_:

 - **standard**:

   multiple scattering, electron ionization, electron bremsstrahlung, e+e- annihilation,
   e+e- annihilation to hadrons, e+e- annihilation to mu pair, muon ionization, muon bremsstrahlung,
   e+e- pair production by muons, hadron ionization, ion ionization,
   Compton scattering, polarized Compton scattering, photo-electric effect, gamma conversion,
   gamma conversion to muons, Cerenkov radiation, scintillation, synchrotron radiation,
   forward transition radiation, transition radiation, gamma, transition radiation, regular,
   transition radiation, straw tube, transition radiation, transparent


 - **low energy**:

   ionization, bremsstrahlung, hadron ionization, Compton scattering,
   polarized Compton scattering, photo-electric effect, gamma conversion,
   Rayleigh scattering, polarized Rayleigh scattering

 - **Penelope**:

   ionization, bremmstrahlung, e+e- annihilation, Compton scattering,
   photo-electric effect, gamma conversion, Rayleigh scattering

 - **very low energy (Geant4 DNA)**:

   elastic scattering, excitation, ionisation, charge decrease, charge increase

 - **Optical photons**:

   Rayleigh scattering, bulk absorption, reflection, refraction, wavelength shifting

The models are collected and their parameters are adjusted in several EM packages. In the table below you can find the code
used by gemc to call the various packages.

====     ===================    ===================================================================================================================================
Code     geant4 package                           Summary Description
----     -------------------    -----------------------------------------------------------------------------------------------------------------------------------
STD       emstandard            The default EM constructor is used in major part of reference Physics Lists (FTFP_BERT, FTF_BIC, QGSP_FTFP_BERT, QGSP_BIC, ...).
EMV       emstandard_opt1       Designed for HEP productions. Production thresholds are enabled on secondary particles for all EM processes.
EMX       emstandard_opt2       Designed for HEP productions. Alternative G4Generator2BS angular generator is used for the bremsstrahlung process.
EMY       emstandard_opt3       Higher accuracy of electrons, hadrons and ion tracking without magnetic field.
EMZ       emstandard_opt4       Higher accuracy of electrons, hadrons and ion tracking. Use the most accurate standard and low-energy models.
LIV       emlivermore           Higher accuracy of electrons, hadrons and ion tracking without magnetic field. Livermore model on top of emstandard_opt4.
LVP       emlivermore_polar     emlivermore with polarized photo electric effect, compton scattering, gamma conversion and rayleigh models.
PEN       empenelope            Higher accuracy of electrons, hadrons and ion tracking without magnetic field. Penelope model on top of emstandard_opt4.
LEM       emlowenergy           Designed on top of Livermore physics for validation of new low-energy models.
====     ===================    ===================================================================================================================================

|

A more detailed description of these packages can be found in the
`geant4 EM constructors page <http://geant4.cern.ch/collaboration/working_groups/electromagnetic/physlist10.1.shtml>`_.

The EM interactions software implementation is documented in the
`Physics Reference Manual <http://geant4.web.cern.ch/geant4/G4UsersDocuments/UsersGuides/PhysicsReferenceManual/html/>`_.

Hadronic Processes
------------------

The hadronic processes included in geant4 `are <http://geant4.cern.ch/support/proc_mod_catalog/processes/>`_:

 - **Hadronic In-flight**:

   - **Generic**:

     elastic, capture, fission

   - **Inelastic**:

     pi+ inelastic, pi- inelastic, K+ inelastic, K- inelastic,
     K0L inelastic, K0S inelastic, proton inelastic, neutron inelastic,
     lambda inelastic, sigma+ inelastic, sigma- inelastic, xi- inelastic,
     xi0 inelastic, omega- inelastic,
     anti-proton inelastic, anti-neutron inelastic, anti-lambda inelastic, anti-sigma+ inelastic,
     anti-sigma- inelastic, anti-xi- inelastic, anti-xi0 inelastic, anti-omega- inelastic,
     deuteron inelastic, triton inelastic, alpha inelastic, ion inelastic

 - **Hadronic At-rest**:

   pi- absorption, K- absorption 1, K- absorption 2, anti-proton annihilation,
   anti-neutron annihilation, neutron capture at rest, negative hadron capture, radioactive decay

 - **Gamma- and Lepto-Nuclear**:
   electron nuclear, positron nuclear, gamma nuclear,
   muon nucleus in-flight, muon capture

The models are collected and their parameters are adjusted in several packages. You can find a description of all the
packages and their codes at the `Geant4 Reference Physics Lists <http://geant4.cern.ch/support/physicsLists/referencePL/referencePL.shtml>`_.

The hadronic interactions software implementation is documented in the
`Physics Reference Manual <http://geant4.web.cern.ch/geant4/G4UsersDocuments/UsersGuides/PhysicsReferenceManual/html/>`_.


References
----------

- `Electro and gamma nuclear physics in Geant4 <http://arxiv.org/pdf/nucl-th/0306012v1.pdf>`_ : *arXiv:nucl-th/0306012*
- `Recent Developments and Validation of Geant4 Hadronic Physics <http://iopscience.iop.org/article/10.1088/1742-6596/396/2/022060/pdf>`_ : *Journal of Physics: Conference Series 396 (2012) 022060*
- `Geant4 Physics Reference Manual <http://geant4.web.cern.ch/geant4/UserDocumentation/UsersGuides/PhysicsReferenceManual/fo/PhysicsReferenceManual.pdf>`_.
- `Geant4 Physics Validation and Verification <http://geant4.cern.ch/results/validation_plots.htm>`_.


