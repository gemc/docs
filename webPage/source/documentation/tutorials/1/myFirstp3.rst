:orphan:

=====================
My First Volume *3/5*
=====================


myFirst.pl
----------

This script calls the routines defined in *target.pl* and *paddle.pl*.  It calls these routine twice,  once per variation::


 my @allConfs = ("short", "long");

 foreach my $conf ( @allConfs )
 {
	$configuration{"variation"} = $conf ;
	
	# geometry
	build_simple_paddle();
	build_target();
 }


This script will read the *config.dat* file and create two version of the geometry, "short" and "long". Go ahead and run it!::

 ./myFirst.pl config.dat

You should see that two files are created:
 * example__geometry_long.txt
 * example__geometry_short.txt


As you can see the variation is part of the filename. You can choose the variation by specifying in the gcard file::


 <detector name="example" factory="TEXT" variation="long"/>


|

.. image:: ../next.png
	:target: 	myFirstp4.html
	:align: right


.. image:: ../previous.png
	:target: 	myFirstp2.html
	:align: left

