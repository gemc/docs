:orphan:

.. _docker:

.. |br| raw:: html

   <br>


|br|


Latest Releases
---------------

- `5.12 <https://github.com/gemc/clas12Tags/releases/tag/5.12>`_ released on Nov 17, 2025
- `5.11 <https://github.com/gemc/clas12Tags/releases/tag/5.11>`_ released on Jan 17, 2025
- `dev <https://github.com/gemc/clas12Tags/releases/tag/dev>`_ released nightly


|br|

Table of Contents
-----------------

- :ref:`Build and Install GEMC from source code <build-gemc-source>`
- :ref:`Run GEMC in a Docker Container <run-gemc-docker>`
- :ref:`Run GEMC  using apptainer <run-gemc-apptainer>`
- :ref:`GEMC for CLAS12 <gemc-clas12>`


|br|

.. _build-gemc-source:

Build and Install GEMC from source code
---------------------------------------

These instructions are based on the `ceInstall <https://github.com/JeffersonLab/ceInstall>`_ utility,
which allows installation of the software through environment modules.

Below we will use ``/opt/software`` as the installation location. Make sure all
the `requirements <https://github.com/JeffersonLab/ceInstall#requirements>`_ are met.


1. Clone the repo:

.. code-block:: text

 cd /opt/software
 git clone https://github.com/jeffersonlab/ceInstall


2. Setup the environment. It is a good idea to put the following command in your shell init script so you do not have
to type it every time:

.. code-block:: text

 module use /opt/software/ceInstall/modules

3. Use the install scripts to get and compile the desired GEMC version. For example, to install 5.12:

.. code-block:: text

 module load gemc/5.12
 install_gemc 5.12

The ``install_gemc`` command will install, along gemc,  all its necessary
dependencies: clhep, xercesc, geant4, ccdb, hipo, cmag.

More details can be found on the  `ceInstall repository <https://github.com/JeffersonLab/ceInstall>`_

.. note::

 This procedure has been tested for recent versions of fedora, almalinux and macos. It may not work with older versions.
 Please report to ungaro@jlab.org if you have any problems with the installation.


|br|

|br|


.. _run-gemc-docker:


Run GEMC in a Docker Container
------------------------------

GEMC distributed using `<https://www.docker.com>`_, that can be downloaded `here <https://www.docker.com/community-edition>`_.

|br|

The following docker containers are available. These contains the last couple of versions of gemc:

- jeffersonlab/gemc:dev-fedora36
- jeffersonlab/gemc:dev-almalinux94


The container registry is `here <https://hub.docker.com/r/jeffersonlab/gemc/tags>`_.


1. Make sure the container is up-to-date:

.. code-block:: text

 docker pull jeffersonlab/gemc:dev-almalinux94


2. Open a bash session on the container to run gemc in batch mode:

.. code-block:: text

 docker run --platform linux/amd64 -it --rm -v ~/mywork:/usr/local/mywork jeffersonlab/gemc:dev-almalinux94 bash

You will need to use the option USE_GUI=0 to run gemc in batch mode.

.. note::

 As of November 2025 running interactively (USE_GUI>0) is not possible. It will be reinstated beginning of 2026.

|br|

|br|

.. _run-gemc-apptainer:


Run GEMC using apptainer
------------------------

Linux host can use apptainer (formally singularity) to run docker containers.
It uses a cache directory to store the images so I suggest to set that cache to a location with large disk capacity.

In the following example we use /path/to/user/cache for the base cache dir:

.. code-block:: text

 export sif_cache=/path/to/$USER/sif

and then set the other variables.

.. code-block:: text

 export APPTAINER_CACHEDIR=$sif_cache/apptainer-cache
 export APPTAINER_TMPDIR=$sif_cache/apptainer-tmp
 export TMPDIR=$sif_cache/apptainer-tmp

Apptainer can be run like this:

.. code-block:: text

 apptainer exec --cleanenv --bind ~/mywork:/usr/local/mywork jeffersonlab/gemc:dev-almalinux94 bash


|br|


.. _gemc-clas12:


GEMC for CLAS12
---------------

A dedicated version of `GEMC dedicated to the CLAS12 <https://github.com/gemc/clas12Tags>`_ experiments
at Jefferson Lab is distributed along geometry databases. On the repository README you will find
instructions on how to use it, including modifying the geometry.

|br|











