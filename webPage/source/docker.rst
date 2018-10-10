
:orphan:

.. _docker:

.. |br| raw:: html

   <br>

GEMC on Docker
--------------

GEMC distributed using `<https://www.docker.com>`_. You can download docker for free `here <https://www.docker.com/community-edition>`_.


Running GEMC in interactive mode (browser)
------------------------------------------

To use the geant4 opengl GUI use the following command::

 docker run -it --rm -p 6080:6080 jeffersonlab/gemcinteractive:2.7

Using your web brower open the page::

 http://localhost:6080

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
 - Share mode active (this will ensure if you open another browser session, it will show the same instance of the container)
 - On the docker preferences try to make available as much memory as possible.

|br|

You can stop the docker container using ctrl-c.

|

Running GEMC in interactive mode (vnc)
--------------------------------------

Use the following command to pass so you can open the container with the browser or a vnc client::

 docker run -it --rm -p 6080:6080 -p 5901:5901 jeffersonlab/gemcinteractive:2.7

You can now open localhost:5901 with your vnc client.

|



Running GEMC in batch mode
--------------------------

Use the following command to open a bash session on the container. You can also replace bash with tcsh::

 docker run -it --rm jeffersonlab/gemcbatch:2.7 bash

This will open the session in the /jlab/work directory. When executed the first time these will also download the image on your computer.
Use the gemc option USE_GUI=0 to run gemc in batch mode. Try the examples above.

|br|


Running the container in interactive mode (no opengl)
-----------------------------------------------------

On a mac, if you allow access from localhost with::

  1. Activate the option ‘Allow connections from network clients’ in XQuartz settings
     (Restart XQuartz (to activate the setting)
  2. xhost +127.0.0.1

Then you can run docker and use the local X server with::

 docker run -it --rm -e DISPLAY=docker.for.mac.localhost:0 jeffersonlab/gemcbatch:2.7 bash

You can run gemc in batch mode this way, but still enjoy the ability to open windows on the local host.


|


Mounting your directories to the container
------------------------------------------

The container will always start with the "pristine" image. In other words every work the the container filesystem will be lost when you exit docker.
You can use the option::

 -v /host/directory:/container/directory

to mount your local OS directories to be visible in docker. For example, to mount the "maximilian" home directory in a /max dir in the container:

 docker run -it --rm  -v /home/maximilian:/max jeffersonlab/clas12tags:4a.2.4 bash

/max now points to maximilian home dir. You can save work here.

|


Troubleshooting
---------------

- `Solving Docker permission denied while trying to connect to the Docker daemon socket <https://techoverflow.net/2017/03/01/solving-docker-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket/>`_

|



Other Downloads
===============

Generator: LUND Events sample
-----------------------------
`10 Deep Inelastic Scattering events in LUND format <http://jlab.org/12gev_phys/packages/gcards/dis.dat>`_

|

Experiments Specifics Downloads: CLAS12
=======================================

Magnetic Fields
---------------
Some experiment require magnetic field maps. For example, clas12 field maps are located here:

 * `new clas12 solenoid <http://clasweb.jlab.org/12gev/field_maps/clas12NewSolenoidFieldMap.dat>`_
 * `old clas12 solenoid <http://clasweb.jlab.org/12gev/field_maps/clas12SolenoidFieldMap.dat>`_
 * `torus               <http://clasweb.jlab.org/12gev/field_maps/TorusSymmetric.dat>`_

|

Running CLAS12 simulations on the Jefferson Lab Interactive farm
================================================================

GEMC and the CLAS12 geometry is installed on /group/clas12/gemc. To use, source the environment::

 source /group/clas12/gemc/environment.csh

|br| |br|

As an example, to run gemc using the official clas12 gcard::

 gemc /group/clas12/gemc/4a.2.4/clas12.gcard -N=100 -USE_GUI=0

|

GEMC Release Notes
------------------
For release notes and the complete changelog see :ref:`release notes <releaseNotes>`.

|br| |br|






