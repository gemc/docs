:orphan:

.. _docker:

.. |br| raw:: html

   <br>

Installation
------------

Refer to the `ceInstall <https://github.com/JeffersonLab/ceInstall>`_ page for the latest instructions on how to use gemc at Jefferson Lab,
or through CVMFS, or by building it from source.



|br|



Using Docker
------------

GEMC distributed using `<https://www.docker.com>`_. You can download docker for free `here <https://www.docker.com/community-edition>`_.

The following docker containers are available:

- jeffersonlab/gemc:dev-fedora36
- jeffersonlab/gemc:dev-almalinux94
- jeffersonlab/gemc:dev-ubuntu24

Use the following command to open a bash session on the container.

Batch mode::

 docker run --platform linux/amd64 -it --rm -v ~/mywork:/usr/local/mywork jeffersonlab/gemc:dev-almalinux94 bash

You need to use the option USE_GUI=0 to run gemc in batch mode.

|br|


Interactive mode (browser)::

As of November 2025 this is not possible at the moment but in a couple of months it should be reinstaed

|br|

Using Apptainer
---------------

Linux host have apptainer (formally singularity), that can be run similarly to docker.
It uses a cache directory to store the images so I suggest to set that cache to a location with large disk capacity.
In the following example /path/to/user/cache is used::

	export sif_cache=/path/to/$USER/sif

and then::

	export APPTAINER_CACHEDIR=$sif_cache/apptainer-cache
	export APPTAINER_TMPDIR=$sif_cache/apptainer-tmp
	export TMPDIR=$sif_cache/apptainer-tmp
	apptainer exec --cleanenv --bind ~/mywork:/usr/local/mywork <image> command



 1. USS enterprise shooting against a dragon::

     module switch gemc/dev
     cd $GEMC_DATA_DIR/experiments/forFun
     gemc fun.gcard -USE_GUI=2 -OUTPUT="txt, out.txt"

 2. Fire protons in the upper gastrointestinal tract::

     module switch gemc/dev
     cd $GEMC_DATA_DIR/experiments/humanBody:
     gemc hb.gcard -USE_GUI=2 -OUTPUT="txt, out.txt"

|br|

.. note::

 - As of 8/14/2024 interactivity won't work on Sonoma 14.5 if you activate Rosetta on docker. You need to disable it (unfortunately it will be slower).

 Suggested noVNC settings:

 - Scaling mode: remote
 - Shared mode active (this will ensure if you open another browser session, it will show the same instance of the container)
 - On the docker preferences try to make available as much memory as possible.

|br|

You can stop the docker container at any time using ctrl-c in the shell session you started it from.



|br|

Troubleshooting
---------------

- `Solving Docker permission denied while trying to connect to the Docker daemon socket <https://techoverflow.net/2017/03/01/solving-docker-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket/>`_

|br|



Other Downloads
===============

Generator: LUND Events sample
-----------------------------
`10 Deep Inelastic Scattering events in LUND format <http://jlab.org/12gev_phys/packages/gcards/dis.dat>`_

|br|




GEMC Release Notes
------------------
For release notes and the complete changelog see :ref:`release notes <releaseNotes>`.

|br| |br|






