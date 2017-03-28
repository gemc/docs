
========================
My First Volume  - *1/5*
========================

In this tutorial you will build a liquid hydrogen target and
a paddle made from a custom scintillator material. You will use variations to study two options for paddle length.
This could be done using a single perl script, however the code is organized in a "paddle" and a "target" script to give an idea
on how to work with more complex geometries.

Pre-requisites
^^^^^^^^^^^^^^
Tarball containing the material for this tutorial: `myFirst.tar <https://gemc.jlab.org/gemc/html/documentation/tutorials/material/myFirst.tar>`_.

To unpack::

 tar -xpvf myFirst.tar

MYSQL or TEXT?
^^^^^^^^^^^^^^

Take a look at the file *config.dat*. Notice the entries that speficy the detector name,
and the factory::

 # Detector name and variation
 detector_name: example
 factory:       TEXT

The **factory**  will select the format in which the geometry is saved. Here we will work in offline mode (TEXT) using a
local database (a text file). If MYSQL was selected, the geometry would go in a MYSQL database.
The **detector_name** is the name of the database. All volumes, materials, sensitivity definitions, etc are grouped under
this name.

Variation
^^^^^^^^^

A *variation* of a detector is a different version of it.
In this example we will create **two variations**: "short" and "long" to compare different detectors (short and long paddle).



Hierarchy
^^^^^^^^^

Take a look at *paddle.pl*, the file that builds the paddle.

The following lines of code define the volume name, its mother volume and a description of it::

   $detector{"name"}        = "paddle_1";
   $detector{"mother"}      = "root";
   $detector{"description"} = "Example of paddle";

The position and rotation of a volume are relative to its mother volume. The rotation will happen before the
position. "root" is the root volume.

|

.. image:: ../../next.png
	:target: 	simple1p2.html
	:align: right


