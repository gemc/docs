
===============
My First Volume
===============

In this tutorial you will build a liquid hydrogen target and
a paddle with a custom scintillator material.

You can find the 

MYSQL or TEXT?
--------------

Let's work in offline mode using a local database (a text file).
Create a new file called *config.dat* and edit it like this::

 # Detector name and variation
 detector_name: example
 variation:     mine
 factory:       TEXT

 # run ranges and variation will apply to geometry, materials and parameters
 rmin:       1
 rmax:       10000

 comment: tutorial example of a target and a scintillator

 verbosity: 1





