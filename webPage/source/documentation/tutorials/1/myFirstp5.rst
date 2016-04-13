:orphan:

=======================
My First Volume - *5/5*
=======================


Materials
----------

A simple scintillator material is C9H10. It has two elements, Carbon and Hydrogen. The molecule has 9 and 10 atoms respectively.

The relevant lines in the material definition file (*materials.pl*) are::

 $mat{"ncomponents"} = "2";
 $mat{"components"}  = "C 9 H 10";

In order to use this material, first load it in the main script myFirst.pl by adding, right after the paddle.pl require, the lines::

 # materials
 require "./materials.pl";

To call the routine, put it in the loop (after build_target is ok)::

 materials();

Now the material will be loaded, with "myFirstscintillator" name. To use it, change the material entry in paddle.pl::

 $detector{"material"} = "myFirstscintillator";

Write out the new material
--------------------------

Execute the main script again:

 ./myFirst.pl config.dat

You should see that four files are created this time. Two additional files describe the materials [#]_.

Voilà, you are now assigning your very own material to the paddle. Remember you can change the variation in the gcard. Run gemc::

 gemc example.gcard


You can verify the material in the GUI (detector page) or by specifying the
option::

 -MATERIAL_VERBOSITY=4.

Congratulations, you created your very first volumes and material in GEMC!


.. rubric:: Footnotes

.. [#]  Since we didn't change the paddle composition based on the variation name, the two files
        happen to be identical. 

|


.. image:: ../previous.png
	:target: 	myFirstp4.html
	:align: left

