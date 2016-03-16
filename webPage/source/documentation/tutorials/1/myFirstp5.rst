:orphan:

=====================
My First Volume *5/5*
=====================


Materials
----------

Let’s create a “scintillator” material.

In geant4 materials can be made by
 - molecular composition: counting the number of atoms of each element
 - fractional mass: a composite of other materials, each with its own mass percentage.

We’ll use the molecular composition. Take a look at materials.pl.

A simple scintillator material is C9H10. It has two elements, Carbon and Hydrogen. The molecule has 9 and 10 atoms respectively.

The relevant lines in the material definition are::

 $mat{"ncomponents"} = "2";
 $mat{"components"}  = "C 9 H 10";

In order to use this materials, first load it in the main script myFirst.pl by adding, right after the paddle.pl require, the lines::


 # materials
 require "./materials.pl";

Now the material will be loaded, with "myFirstscintillator" name. To use it, change the material entry::

 $detector{"material"} = "myFirstscintillator";

Voilà, you are now assigning your very own material to the paddle. You can verify this in the GUI (detector page) or by specifying the
option::

 -MATERIAL_VERBOSITY=4.

Congratulations, you created your very first volumes and material in GEMC!

|


.. image:: ../previous.png
	:target: 	myFirstp4.html
	:align: left

