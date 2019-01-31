
##################
Particles Ancestry
##################

.. _ancestry:


The SAVE_ALL_ANCESTORS option can be set to 1 to save ancestral trajectory to output.

Then information about any trajectories which are ancestral to hits in the detectors is written to a new bank named ancestors with bank tag 80.


This can be useful particularly in combination with the RNG saving:

1. run with the :ref:`SAVE_SELECTED <rerunEvents>` option and the default SAVE_ALL_ANCESTORS=0 to get the RNG for the few events of interest
2. rerun them with SAVE_ALL_ANCESTORS=1, then do post-analysis of their trajectory history.


