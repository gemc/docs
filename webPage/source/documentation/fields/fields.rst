
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
		<symmetry type="cylindrical-z" format="map"/>
		<map>
			<coordinate>
				<first  name="transverse"    npoints="601"   min="0"  max="3" units="m"/>
				<second name="longitudinal"  npoints="1201"  min="-3" max="3" units="m"/>
			</coordinate>
			<field unit="T"/>
		</map>
	</mfield>
	0.000  -3.000       0.000000     0.005970
	0.000  -2.995       0.000000     0.006010
	0.000  -2.990       0.000000     0.006051
	0.000  -2.985       0.000000     0.006091


.. _fieldAttributes:

Field maps properties
---------------------

The following field map properties can be set in the **FIELD_PROPERTIES** gcard / command line option:

- minimum step in the magnetic field. Default: 1 mm.
- integration method. Default: G4ClassicalRK4.
- interpolation method. Default: linear.

For example::

 -FIELD_PROPERTIES="srr-solenoid, 1*mm, G4ClassicalRK4, linear"

Will set the *srr-solenoid* field minimum step to 1 mm, the integration method to the
classical fourth order range kutta, and will use linear interpolation.

The available integration method are:

- G4CashKarpRKF45: Fift Order Range Kutta, for very smooth fields
- G4ClassicalRK4: Fourth Order Range Kutta. Robust for every field.
- G4SimpleHeum: Third order stepper.
- G4SimpleRunge: Simplified (second order) Range Kutta (faster).
- G4ImplicitEuler: Second order stepper, for faster varying fields.
- G4ExplicitEuler: First order stepper, for rough fields.
- G4HelixImplicitEuler: Second order, specialized for helix-like trajectories.
- G4HelixExplicitEuler: First order, specialized for helix-like trajectories.
- G4HelixSimpleRunge: Second order Range Kutta, specialized for helix-like trajectories.
- G4NystromRK4: provides accuracy near that of G4ClassicalRK4 with a significantly reduced cost in field evaluation.

The available interpolation methods are:

- none: closest grid point.
- linear: linear interpolation.




Multipoles
----------

Multipoles can be defined using xlm files. For example, to create a simple dipole field and also rotate it by 0.02 radians along the y axis
store the definition below in an ascii file with .dat extension:

.. code-block:: bash

	<mfield>
	 <description name="simple_dipole1" factory="ASCII" comment="simple dipole example"/>
	 <symmetry type="multipole" format="simple" integration="RungeKutta" minStep="1*mm"/>
	 <dimension Npole="2" scale="0.2" Bunit="T" x="-0.03" y="0" z="-12" XYZunit="m" rot="0.02" ROTunit="rad" ROTaxis="Y"/>
	</mfield>



.. _scalingField:

Scaling a Field
---------------

The option **SCALE_FIELD** can be used to scale an electro-magnetic field. For example::

 -SCALE_FIELD="srr-solenoid, -0.5"

will invert and scale the *srr-solenoid* field values by 0.5.


.. _translatingAndRotatingField:

Translating/Rotating a Field
----------------------------

The options **DISPLACE_FIELDMAP** and **ROTATE_FIELDMAP** can be used to shift a field map origin and/or rotate a field map.

Shift example::

 -DISPLACE_FIELDMAP="srr-solenoid, 3.5*mm, 0*mm, 0*mm"

this will shift the map origin from (0, 0, 0)mm to (3.5, 0, 0)mm

Rotation example::

 -ROTATE_FIELDMAP="srr-solenoid, 15*deg, 0*deg, 0*deg"

this will rotate the map 15 degrees along the x-axis.








Getting the field value at one point
------------------------------------

1. Set the BEAM_V option at the point location you want to probe.
2. Set FIELD_VERBOSITY to 99.
3. Set N=1
4. (optional) use batch mode: USE_GUI=0

GEMC will generate a track at that location, print the field values, then exit.

For example, to check the field at x (10, 11, 12)cm::

 -BEAM_V=(10, 11, 12)cm -FIELD_VERBOSITY=99 -N=1


















