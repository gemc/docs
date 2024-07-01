
:orphan:

.. _docker:

.. |br| raw:: html

   <br>

Compiling from Source
---------------------

The following instructions works in **bash** or **zsh** shells.

GEMC and the dependency libraries can be compiled using the repository 'ceInstall' :

|br|

1. Make sure the ALL `requirements <https://github.com/JeffersonLab/ceInstall?tab=readme-ov-file#requirements>`_ are satisfied.
**You may need root priviledges to install certain system packages**.

2. Choose an (existing) installation directory, for example /opt/sim and point SIM_HOME to it.
   Make sure the directory exists and you have write permissions to it::


	export SIM_HOME=/opt/sim


3. Clone the latest tag of ceInstall repository inside $SIM_HOME and use its modules::

	cd $SIM_HOME
	git clone https://github.com/JeffersonLab/ceInstall
	module use "${SIM_HOME}"/ceInstall/modulefiles


4. Run the installation script::

	$SIM_HOME/ceInstall/install/install_gemc <version>

<version> can be:

- `4.4.2`: uses `geant4 10.6.2` and clas12Tags `4.4.2`
- `5.10`: uses `geant4 10.7.4` and clas12Tags `5.10`
- `2.12`: uses `geant4 10.7.4` and gemc `2.12`



|br|


GEMC on Docker
--------------

GEMC distributed using `<https://www.docker.com>`_. You can download docker for free `here <https://www.docker.com/community-edition>`_.

|br|


Using Docker
------------

Use the following command to open a bash session on the container. You can also replace bash with tcsh::

 docker pull jeffersonlab/gemc:dev-fedora36
 docker run -it --rm jeffersonlab/gemc:dev-fedora36 bash

This will open the session in the /jlab/work directory.
Use the gemc option USE_GUI=0 to run gemc in batch mode.

|br|


Interactive mode (browser)
--------------------------

To use the native geant4 opengl GUI use the following command::

 docker run -it --rm  -p127.0.0.1:6080:6080 jeffersonlab/gemc:dev-fedora36

Using your web brower open the page::

http://localhost:8080/vnc.html

After clicking connect the linux desktop is shown with a running shell.

You should launch gemc with USE_GUI=2 to optimize the opengl graphic. Try a few examples:

 1. USS enterprise shooting against a dragon::

     cd forFun: gemc fun.gcard -USE_GUI=2 -OUTPUT="txt, out.txt"

 2. Fire protons in the upper gastrointestinal tract::

     cd humanBody: gemc hb.gcard -USE_GUI=2 -OUTPUT="txt, out.txt"

|br|

.. note::

 I suggest to set the noVNC settings as follows:

 - Scaling mode: remote
 - Shared mode active (this will ensure if you open another browser session, it will show the same instance of the container)
 - On the docker preferences try to make available as much memory as possible.

|br|

You can stop the docker container at any time using ctrl-c in the shell session you started it from.

|br|



Mounting your directories to the container
------------------------------------------

The container will always start with the "pristine" image. In other words every work the the container filesystem will be lost when you exit docker.
You can use the option::

 -v /host/directory:/container/directory

to mount your local OS directories to be visible in docker. For example, to mount the "maximilian" home directory in a /max dir in the container:

 docker run -it --rm  -v /home/maximilian:/jlab/work/max jeffersonlab/gemc:dev-fedora36 bash

*/jlab/work/max* will now point to maximilian home dir. You can save work here.

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






