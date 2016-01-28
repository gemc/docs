
#####################
GEMC at Jefferson Lab
#####################

gemc is installed on the JLab interactive *ifarm65* CUE machines and on the JLab farm nodes.
This section describes how to run gemc on the CUE machines, using the CLAS12 detectors setup as exanple.

Sourcing the environment
------------------------

The environment is necessary to load the libraries needed to run gemc. To load::

 source /site/12gev_phys/production.csh

csh is supported, and bash is in the works.



Running GEMC
------------

The clas12 detectors geometry and gcard are stored in the M drive (/group).

To run 10 events using clas12 detectors::

 gemc /group/clas12/clas12.gcard -USE_GUI=0 -N=10


The *USE_GUI=0* option tells gemc to run in batch mode. By default gemc would run with USE_GUI=1 (interactive mode).


The output format (default: evio) is specified in the gcard:

.. code-block:: bash

   <option name="OUTPUT" value="evio, out.ev"/>

A text format is also available by replacing *evio* with *txt*.



Command line/gcard options
--------------------------


The gcards and/or command line set the simulation conditions.
The command line overwrites the gcard value.

The gemc command line options are in the format::

   -OPTION="argument"

For example, to set the primary beam particle type, momentum, theta and phi::

   -BEAM_P="e-, 6*GeV, 15*deg, 20*deg"

The corresponding option in the gcard has a *name* / *value* syntax like this:

.. code-block:: bash

   <option name="BEAM_P" value="e-, 6*GeV, 15*deg, 20*deg"/>


All command line options can be used in the gcard and viceversa.
See also :ref:`gemcOption`.



Loading / Unloading detectors
-----------------------------

A detector can be loaded with several variations (a variation could have a different material, or dimensions, or positioning).

To load a detector in the gcard:

.. code-block:: bash

   <detector name="<path>/bst" factory="TEXT" variation="original"/>

Where *name* points to the name (with path) of the detector system and *variation* points to its variation.
To remove a detector simply remove or comment its corresponding line.

The true information output is disabled by default. To activate it for a given system use the *INTEGRATEDRAW* flag.
For example, to save bst and dc detectors true information:

.. code-block:: bash

 <detector name="INTEGRATEDRAW" value="bst, dc"/>

The digitized information is activated by default but could be disabled, in similar fashion, with the *INTEGRATEDDGT* option.


Using the internal generator
----------------------------

A primary particle 4-momentum and vertex ranges can be set with the directives:

.. code-block:: bash

 <option name="BEAM_P"   value="proton, 4.0*GeV, 20.0*deg, 10*deg"/>
 <option name="SPREAD_P" value="1*GeV, 10*deg, 180*deg"/>
 <option name="BEAM_V"   value="(0, 0, -5)cm"/>
 <option name="SPREAD_V" value="(0.1, 10)cm"/>

The above will generate a proton with:
* :math:`p` between 3 and 5 GeV.
* :math:`\theta` between 10 and 30 degrees.
* :math:`\phi` between 0 and 360 degrees.
* vertex z between -5 and 5 cm.
* vertex radius between 0 and 0.1 cm.



Using a custom generator
------------------------

gemc support the  :ref:`lund`.
To generate events using a LUND file::

-INPUT_GEN_FILE="LUND, filename"


See :ref:`generator` for more details.




Generating Background
---------------------

To add background coming from the beam interactions with any materials the following quantities must be defined:

1. a time window: the total time of one event
2. the number of beam particles for each event
3. the number of beam bunches

These quantities are defined with the *LUMI_EVENT* option.
For example for clas12 :math:`10^{35}` luminosity on 5cm LH2 target:

.. code-block:: bash

 <option name="LUMI_EVENT"     value="124000, 250*ns, 2*ns" />
 <option name="LUMI_P"         value="e-, 11*GeV, 0*deg, 0*deg" />
 <option name="LUMI_V"         value="(0.,0.,-10.)cm" />
 <option name="LUMI_SPREAD_V"  value="(0.01, 0.01)cm" />

Adds 124000 e- in 250 ns time window, grouped in 2 ns bunches. That would produce 125 bunches with 992 particles each bunch.
The beam is 100 micron wide and starts 10 cm upstream of the center of the target.


Scaling Magnetic Fields
-----------------------

There are two magnetic fields: torus (*clas12-torus-big*)  and solenoid (*clas12-solenoid*).


They both can be scaled with the *SCALE_FIELD* option. For example:

.. code-block:: bash

 <option name="SCALE_FIELD" value="clas12-torus-big, -0.8"/>
 <option name="SCALE_FIELD" value="clas12-solenoid, 0.5"/>

will invert and scale the torus, and halve the solenoid.

.. note::

 The torus field is automatically loaded with the forward carriage volume. To activate the solenoid field, the option
 <option name="HALL_FIELD"  value="clas12-solenoid"/> is needed.


.. note::

 By default the torus map has e- outbending. So in order to have e- in-bending the torus field has to be
 scaled by -1 (done in the clas12 gcard).



Command line help
-----------------

Typing gemc -help will show the help sub-categories:

.. code-block:: bash

 Help Options:

 >  -help-all:  all available options.

 >  -help-control             control options.
 >  -help-general             general options.
 >  -help-generator           generator options.
 >  -help-luminosity          luminosity options.
 >  -help-mysql               mysql options.
 >  -help-output              output options.
 >  -help-physics             physics options.
 >  -help-verbosity           verbosity options.

You can access to a specific subcategory like this::

 gemc -help-control



GEMC on a personal computer
---------------------------

gemc can be installed on apple computers using the dmg found in :ref:`downloads`.

For linux OSes a installation from source is required.
Here are the `installation instructions <https://www.jlab.org/12gev_phys/packages/sources/ceInstall/1.2_install.html>`_.


The CLAS12 detectors geometry, materials, fields etc can be downloaded from the :ref:`downloads`.


