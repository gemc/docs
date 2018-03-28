
############
Installation
############



Installing gemc on a Mac using the DMG
--------------------------------------

gemc can be installed on apple computers using the dmg found in :ref:`gemc downloads <downloads>`.



.. _installFromScratch:

Getting and compiling gemc
--------------------------

gemc requires several libraries and environment:

 * clhep
 * qt
 * geant4
 * xercesc
 * evio
 * ccdb


`Here are the step by step instructions on how to install gemc and all its dependencies <https://www.jlab.org/12gev_phys/packages/sources/ceInstall/2.0_install.html>`_.

All the packages listed "go_gemc" are necessary in order to run gemc. The packages listed below
"go_gemc" are not necessary to run gemc.

Some experiment's geometry, materials, fields etc can also be downloaded from the :ref:`downloads`.


Gemc source code (github)
-------------------------

If you have the dependencies above and environment already installed you can simply get the gemc
`source code from github <https://github.com/gemc/source>`_ and type::

 cd source
 scons -jN OPT=1

to compile gemc. N refers to the numbers of cores in your processor and the "OPT=1" argument
tells scons to compile with optimization.

