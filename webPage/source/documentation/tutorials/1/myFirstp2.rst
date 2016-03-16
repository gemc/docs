:orphan:

=====================
My First Volume *2/5*
=====================



Geometry
--------

We want the paddle 30 cm downstream of the target (0,0,0)::

   $detector{"pos"}         = "0*cm 0*cm 30*cm";
   $detector{"rotation"}    = "0*deg 0*deg 0*deg";

Note that since there is no rotation, we could have omitted the "rotation" entry to make the code more compact.

The type of geant4 solid is "box". In this case its dimensions depend on the variation. Notice how units are specified::

	$detector{"type"}        = "Box";
	
	if($configuration{"variation"} eq "short")
	{
	  $detector{"dimensions"}  = "2*cm 2*cm 4*cm";
	}
	if($configuration{"variation"} eq "long")
	{
	  $detector{"dimensions"}  = "2*cm 2*cm 10*cm";
	}

The material of this paddle is a predefined geant4 material::

	$detector{"material"}    = "G4_GLASS_LEAD";

The color entry is a 6 digit hexadecimal number that represents Red, Green and Blue weights from
0 to 255 each in the form:  RRGGBB::


	$detector{"color"}       = "339999";


Finally, the volume is set to “visible” (0 would be "invisible") and the style to “solid” (0 would be "wireframe")::

	$detector{"visible"}     = 1;
	$detector{"style"}       = 1;



Easy right? *target.pl* looks even easier, since we can omit position (defaulted at (0, 0, 0), rotation and visibility (defaulted at 1).


|

.. image:: ../next.png
	:target: 	myFirstp3.html
	:align: right


.. image:: ../previous.png
	:target: 	myFirstp1.html
	:align: left

