
###########################
Event Saving and Re-Running
###########################

.. _savingEvents:

Saving Events of Interest
-------------------------


The SAVE_SELECTED option can be used to save selected event RNG states.

Usage::

 -SAVE_SELECTED=“<id>, <pid>, <low limit>, <high limit>, <variable>, <directory>”

This tells GEMC to save the RNG state in a file in directory for events in which there is a hit satisfying:

1. Detector ID matches **<id>** in all digit positions where **<id>** does not contain the character ‘x’
2. Particle ID is **<pid>**
3. **<variable>** is in the range from **<low limit>** to **<high limit>**
4. **<directory>** is optional and defaults to the current directory

For example::

 -SAVE_SELECTED="7xx10000, 11, 0.0MeV, 2000MeV, trackE, ./”

saves RNG state in files in the current directory for events in which there was a hit in detectors 70010000, 70110000, 70210000, etc. by an electron with energy from 0 to 2 GeV.


.. _rerunEvents:


Re-running Events of Interest
-----------------------------

The RERUN_SELECTED option allows one to rerun multiple events whose RNG state was saved in a previous pass.

For example, suppose there is a rare background signature of an electron between 100 MeV and 1 GeV in detector ID 1000
and you want to visualize a few dozen such events to investigate where the background is coming from. You can do a batch
run using::

 -SAVE_SELECTED=“1000,11,100*MeV,1*GeV,trackE,./savedirectory”

to save the RNG states for such events into the directory ./savedirectory.

The events are saved in files with names like run2event1322.rndm where 2 is the run number and 1322 is the event number.
Then you can do an interactive run with the same gcard and option::

 -RERUN_SELECTED=“2,./savedirectory”.

Here 2 is the run number from the batch run. With this option, instead of generating new primaries as usual or reading
them from the start of a generator input file, the same primaries as were used in the saved events are generated or read
and they undergo the same processes as before, so these events can be visualized.

Similarly one could rerun these saved events in a batch run with both::

 -RERUN_SELECTED=“2,./savedirectory”  -SAVE_ALL_ANCESTORS=1

to get an output file with the ancestors bank showing information on all trajectories leading to hits in those events.
This avoids having to use SAVE_ALL_ANCESTORS=1 on the full run when ancestors for only a few events are of interest.


