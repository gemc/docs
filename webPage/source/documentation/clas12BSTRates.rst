:orphan:

.. |br| raw:: html

   <br>

##################
Study of BST Rates
##################

.. code-block:: bash

	Please email ungaro@jlab.org devita@jlab.org or mariangela.bondi@ct.infn.it to report inaccuracies or improvement to this page.
	Feel free to do a PR with your suggested changes, the repository of this document is: https://github.com/gemc/docs.git inside webPage.

|br|

This page documents the code and steps necessary to simulate various CLAS12 geometry configurations
on the JLAB farm and run the analysis code to check the effect on the barrel silicon tracker.

We refer here to clas12tag 4.4.2. The environment can be loaded with::

 module load clas12
 module switch gemc/4.4.2

|br|

Repositories needed
-------------------

The code can be found on the repository::

 https://github.com/maureeungaro/analysis

To run the simulation on the farm the scripts are located in this subdir::

 farm/gemc


The code to analyize the bst rate is in this subdir::

 gemc/bst_rates


The clas12tags repo is need to get the gcards::

 https://github.com/gemc/clas12Tags

Main README and directory gcards containing CLAS12 configurations.


The analysis repository should be installed in the CUE machines to run the script to submit jobs.

|br|

Choosing the configurations
---------------------------

The idea is to run one set of simulation for each gcard inside a directory.
The directory could have just one gcard (one configuration only), or several gcards to study different situations

You can find examples of such studies in *farm/gemc/studies*.

The starting point for any CLAS12 study should be based on the gcards in clas12Tags. These contains the most updated
settings to run CLAS12 geometry.


|br|


Removing Detectors not needed
-----------------------------

For the purpose of BST studies, we can remove the whole forward part of the CLAS12 detector. For some extreme cases it
can be important to check the back-scattering from the beamline components. In this case it's better to keep the beamline,
FT and fc volumes.





The important modifications to make are:

- your configuration changes
- adding INTEGRATEDRAW option for bst
- adding beam on target

The INTEGRATEDRAW line adds the geant4 true info for the bst

.. code-block:: bash

	<option name="INTEGRATEDRAW"  value="bst"/>

The following lines add the beam on target for 10^35 luminosity:


.. code-block:: bash

    <option name="LUMI_EVENT"     value="124000, 248.5*ns, 4*ns" />
    <option name="LUMI_P"         value="e-, 10.6*GeV, 0*deg, 0*deg" />
    <option name="LUMI_V"         value="(0.0, 0.0, -10)cm" />
    <option name="LUMI_SPREAD_V"  value="(0.03, 0.03)cm" />
    <option name="RFSETUP"        value="0.499, 40, 20" />


After your modifications, you should have your gcards collected in a directory.


|br|

Editing Master
--------------

You now have one or more gcards collected in a directory, let's call it mystudy.

Modify the Master script to show where that directory is. The script will launch one job / gcard.

- NEVENTS is the number of events / job (20 is a good number)
- MULTI_JOBS is how many jobs / gcard you want. Start with 2 to test things.
- OUTPUTD is where jobs will end. This directory should exist and you should have write permissions
- EXPSD is the directory containing the geometry. Usually on /group

You can also edit the email address but should leave the rest unchanged.

You are now ready to run Master.

Couple of notes:

- the simulations are collected in subdir with the same name as the gcards in mystudy
- each job is within a directory indexed by an integer

|br|


inquireSimulation
-----------------

inquireSimulation is a program to convert the EVIO outputs to ROOT or check the status of your jobs.

inquireSimulation will not run if the bank definitions file of the detector we're interested in is not present in the same dir as inquireSimulation is.
In this case we need "bst", which is what should go on the line::

 set BANKSM  = "bst" # bank to be included in rootification

The bank definition is a bst__bank.txt file that can be found on any experiments/clas12/bst dir. For example::

 /group/clas12/gemc/4.4.2/experiments/clas12/bst


There are two important options when you're ready to collect the ROOT files.

- root: this option will write the ROOT output for ALL the directories in the output path.
- rootr: same as root, but it will also delete the directory once the conversion is done. This option is useful when running massive job, so the index does not get very big. This option guarantee to be run multiple times because it runs only on new directories only.


|br|

running the ROOT macro
----------------------

In  gemc/bst_rates let's edit rates.C in 3 places:

- NCONF should match number of gcards in mystudy
- sconf (array) should reflect the names of the gcards in mystudy
- factor should be a the multiplier for each study (usually 1)


The README gives directions on how to run the macro.
