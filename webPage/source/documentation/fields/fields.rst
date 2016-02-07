
#######################
Electro-Magnetic Fields
#######################


Assigning a field to a volume
-----------------------------
To assign a field to a volume, use the "mfield" entry in the detector description:

.. code-block:: perl

 $detector{"mfield"} = "clas12-torus-big";

If mfield is left empty, or it is "no", the volume could still inherit (if it exists)
a magnetic field from its mother volume.

If the name of the field matches one of the existing field files gemc will build the
field and associate it to the volume at run time.


Assigning a field to *root*
---------------------------
Use the option *HALL_FIELD* to assign a field to root at runtime::

	-HALL_FIELD="fieldname"


Turning off one or all fields
-----------------------------

You can turn off a field with the *NO_FIELD* option. For example, to
turn off "solenoid" and "dipole" fields::

	-NO_FIELD="solenoid, dipole"

You can use "all" to turn off all fields::

	-NO_FIELD=all


Fields are files
----------------
gemc uses xml files to read field definitions. The files location must be pointed by at least
one of these three environment variables:

* JLAB_ROOT (sub dir: noarch/data)
* GEMC_DATA_DIR
* FIELD_DIR

Any field file in these location will be opened to read the field definitions. If the field is
a map, the map will be loaded only if the field is actually requested by a detector.

Constant Fields
---------------

To define a constant field named "unifX" you can paste the xml code below in any filename.dat.
If you point the above environment variables to its location, gemc will automatically read these definitions,
and if any detector needs it, gemc will build the field and associate it to that detector.

.. code-block:: bash

	<mfield>
		<description name="unifX" factory="ASCII" comment="Uniform 10 T Field along x-axis"/>
		<symmetry type="uniform" format="simple"/>
		<dimension bx="10" by="0" bz="0" units="T"/>
	</mfield>



Field maps
----------
Field maps are defined in similar fashion, except the data is part of the file, after the xml header.
Here is an example that define a field named "solenoid". It is a 2D map (cylindrical symmetry around z)
so two columns defined the coordinates (*transverse* and *longitudinal*) and two columns defined the
field values. The header can define the column order as well:


.. code-block:: bash

	<mfield>
		<description name="solenoid" factory="ASCII" comment="superconducting solenoid"/>
		<symmetry type="cylindrical-z" format="map" integration="ClassicalRK4" minStep="0.01*mm"/>
		<map>
			<coordinate>
				<first  name="transverse"    npoints="601"   min="0"  max="3" units="m"/>
				<second name="longitudinal"  npoints="1201"  min="-3" max="3" units="m"/>
			</coordinate>
			<field unit="T"/>
			<interpolation type="none"/>
		</map>
	</mfield>
	0.000  -3.000       0.000000     0.005970
	0.000  -2.995       0.000000     0.006010
	0.000  -2.990       0.000000     0.006051
	0.000  -2.985       0.000000     0.006091


Multipoles
----------



Scaling a Field
---------------



Translating/Rotating a Field
----------------------------




Getting the field value at one point
------------------------------------

















