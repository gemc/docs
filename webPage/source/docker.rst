
:orphan:

.. _docker:

.. |br| raw:: html

   <br>

GEMC on Docker
--------------

GEMC is distributed using docker images. Here is how to install docker `for mac <https://docs.docker.com/docker-for-mac/install/>`_,
`for windows <https://docs.docker.com/docker-for-windows/install/>`_, `for all platforms <https://docs.docker.com/install/>`_ (includes CentOS, Debian,Fedora, Ubuntu).

Below are the instructions on how to run gemc on a container that contains the full CLAS12 geometry.

.. note::

 - On the docker preferences try to make available as much memory as possible.
 - Running a container, for the first time only, will require the download of the container, typically a few GB.

Running GEMC in batch mode
--------------------------

Use the following command to open a bash session on the container. You can also replace bash with tcsh::

 docker run -it --rm jeffersonlab/clas12tags:4a.2.4 bash

This will open the session in the /jlab/workdir directory. |br| |br|

You can run gemc using the gcard in that directory in batch mode. For example, 1000 events::

 gemc clas12.gcard -USE_GUI=0 -N=1000 -PRINT_EVENT=10

|

Running GEMC in interactive mode (browser)
------------------------------------------

Use the following command to pass the 6080 port to noVnc so the container can be opened on a brower::

 docker run -it --rm -p 6080:6080 jeffersonlab/clas12tags:4a.2.4

Using your web brower open the page::

 http://localhost:6080

After clicking connect the linux desktop is shown with a running shell.|br| |br|

You should launch gemc with USE_GUI=2 to optimize the opengl graphic::

 gemc clas12.gcard -USE_GUI=2

|

You can stop the docker container by CTRL-c the docker command

.. note::

 I suggest to set the noVNC settings as follows:

 - Scaling mode: remote
 - Share mode active (this will ensure if you open another browser session, it will show the same instance of the container)

|

Running GEMC in interactive mode (vnc)
--------------------------------------

Use the following command to pass the 5901 and the 6080 ports necessary to open the container with a vnc client::

 docker run -it --rm -p 5901:5901 -p 6080:6080  jeffersonlab/clas12tags:4a.2.4

You can now open localhost:6080 with your vnc client.

|

Mounting your directories to the container
------------------------------------------

The container will always start with the "pristine" image. In other words every work the the container filesystem will be lost when you exit docker.
You can use the option::

 -v /host/directory:/container/directory

to mount your local OS directories to be visible in docker. For example, to mount the "maximilian" home directory in a /max dir in the container:

 docker run -it --rm  -v /home/maximilian:/max jeffersonlab/clas12tags:4a.2.4 bash

Now /max will point to maximilian home dir. You can save work here.


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

 * `solenoid <http://clasweb.jlab.org/12gev/field_maps/clas12SolenoidFieldMap.dat>`_
 * `torus <http://http://clasweb.jlab.org/12gev/field_maps/TorusSymmetric.dat>`_


GEMC Release Notes
------------------
For release notes and the complete changelog see :ref:`release notes <releaseNotes>`.








