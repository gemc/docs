
.. _mergingDataBackground:

.. |br| raw:: html

   <br>

Saving and merging background from experimental data
----------------------------------------------------

Here we describe the mechanism to merge generated events with background from real data, typically using random trigger runs.
The data is presented to GEMC using a text file that includes:

- Detector name (e.g. “dc”)
- Detector element identifier (e.g. sector, superlayer, layer, wire)
- Time (from start time)
- Energy
- Number of photoelectrons detected

These quantities can be derived from the experimental hits during the de-digitization phase of the reconstruction algorithms.

The events in the BackgroundHit class are merged with real hits in the geant4 implementation of the EndOfEvent routine.
They are then processed by the digitization modules as normal hits. An additional Boolean variable “isBackgroundHit” has been
added to the gemc hit definition in case the digitization routines need it.


Timing and Pile-ups
^^^^^^^^^^^^^^^^^^^


The background merging mechanism can be applied to both integrated data or signal versus time data. The hits can be:

- One hit / detector element. For example, one hit is one ADC value for a TOF paddle at a given time.
- A time evolution signal. For example, a Flash ADC board can produce an ADC value every 2 or 4 nanoseconds. All these steps are merged in the simulation.

Both cases are covered by the same mechanism, because it associates a hit to a given time:
the same detector element can receive multiple hits that results in a signal as a function of time.
The time evolution signals merging allows for a proper treatment of pile-ups:



.. thumbnail:: dataMergingMechanism.png
   :width: 95%
   :group: mycenter

|br|

Background Hits ASCII format
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The columns needed in the asci file are:

1. system name
2. event number
3. number of identifiers: for CLAS12 this number is 3, representing sector layer component
4.  detector element identifiers
5.  detector element identifiers
6.  detector element identifiers
7. time (from event start time)
8. energy
9. number of photoelectrons


.. thumbnail:: dataMergeExample.png
   :width: 95%
   :group: mycenter


|br|

How to use
^^^^^^^^^^

The option MERGE_BGHITS can be used in the command line or in the gcard to point at the asci file with background hits.

Assuming “bg.txt” is the name of the file, the syntax for command line is::

 -MERGE_BGHIT=bg.txt

while the syntax in the gcard is::

 <option name=”MERGE_BGHIT” value=”bg.txt”/>


A sample of N background hits could represent a background database to be used for any reaction.
At event number N+1 gemc will reset the background loop so it starts at the beginning of the file.


Use the same data to simulate higher or lower intensity situations
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The events in the data file with the same event number will be assigned to one geant4 event.

One can double the intensity of the data background by assigning two consecutive events to the same event number.


