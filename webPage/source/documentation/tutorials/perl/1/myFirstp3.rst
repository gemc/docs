:orphan:

========================
My First Volume  - *3/5*
========================


myFirst.pl
----------

Now let's put it all together. The myFirst.pl script will read the *config.dat* file and create two variations of the geometry, "short" and "long".
It calls the routines defined in *target.pl* and *paddle.pl* twice, once per variation::


 my @allConfs = ("short", "long");

 foreach my $conf ( @allConfs )
 {
	$configuration{"variation"} = $conf ;
	
	# geometry
	build_simple_paddle();
	build_target();
 }


Go ahead and run it::

 ./myFirst.pl config.dat

You should see that two files are created:
 * example__geometry_long.txt
 * example__geometry_short.txt


The variation is part of the file name. When running gemc you can choose the variation by specifying it in the gcard file::


 <detector name="example" factory="TEXT" variation="long"/>


|

.. image:: ../../next.png
	:target: 	myFirstp4.html
	:align: right


.. image:: ../../previous.png
	:target: 	myFirstp2.html
	:align: left

