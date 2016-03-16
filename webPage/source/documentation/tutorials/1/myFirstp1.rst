
========================
My First Volume  - *1/5*
========================

In this tutorial you will build a liquid hydrogen target and
a paddle with a custom scintillator material. You will use variations to study two options for paddle length.

You can find a tarball material for this tutorial `here <https://gemc.jlab.org/gemc/html/documentation/tutorials/material/myFirst.tar>`_.

MYSQL or TEXT?
--------------

Take a look at the file *config.dat*. Notice the entries that speficy the detector name,
the factory and the variation::

 # Detector name and variation
 detector_name: example
 variation:     mine
 factory:       TEXT



The *factory* option will select what kind of output the script will produce. Let's work in offline mode (TEXT) using a
local database (a text file).

Variation
---------

A *variation* of a detector is a different version of it. For example, one could change the target material or its dimensions.
In this example we will create **two variations**: "short" and "long" to compare different detectors (short and long paddle).



Hierarchy
---------

Take a look at *paddle.pl*, the file that builds the paddle.

The following lines of code define the volume name, its mother volume and a description of it::

   $detector{"name"}        = "paddle_1";
   $detector{"mother"}      = "root";
   $detector{"description"} = "Example of paddle";

The positions and rotation of a volume are relative to its mother volume. The rotation will happen before the
position. "root" is the root volume.

|

.. image:: ../next.png
	:target: 	myFirstp2.html
	:align: right


