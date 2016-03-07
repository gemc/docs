
############
Installation
############



Installing gemc on a Mac using the DMG
--------------------------------------

gemc can be installed on apple computers using the dmg found in :ref:`gemc downloads <downloads>`.


Installing gemc on Linux using the tarball
------------------------------------------
Coming soon!


Installing gemc on Windows 10
-----------------------------
This is expected to happen in Winter 2016.


Installing gemc and its dependencies
------------------------------------

gemc requires several libraries and environment:

 * clhep
 * qt
 * geant4
 * xercesc
 * evio
 * ccdb


 `Here are the installation instructions to install gemc and all its dependencies
<https://www.jlab.org/12gev_phys/packages/sources/ceInstall/1.3_install.html>`_.
All the packages listed "go_gemc" are necessary in order to run gemc. The packages listed below
"go_gemc" are not necessary to run gemc.

Some experiment's geometry, materials, fields etc can also be downloaded from the :ref:`downloads`.



Getting and compiling gemc source code
--------------------------------------

If you have the above libraries and environment already installed you can simply get the gemc
`source code from github <https://github.com/gemc/source>`_ and type::

 cd source
 scons -jN OPT=1

to compile gemc. N refers to the numbers of cores in your processor and the "OPT=1" argument
tells scons to compile with optimization.