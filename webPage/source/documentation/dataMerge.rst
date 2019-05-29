
.. _mergingDataBackground:


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
   :title:

	The red point represent a single hit from a user generated track. Hits information from background (black points)
	can come from an integrated hit (top) or in the form of a signal as a function of time (bottom). The mechanism is the same in both cases.



The option MERGE_BGHITS can be used to merge hits from a file "filename"::

 -MERGE_BGHITS="filename"

The users can use the internal GEMC generator, cosmic model, or a separate LUND file to generate non-background events.

