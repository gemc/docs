
:orphan:

.. _docker:

.. |br| raw:: html

   <br>

GEMC on Docker
--------------

GEMC distributed using `<https://www.docker.com>`_. You can download docker for free `here <https://www.docker.com/community-edition>`_.


Using Docker
------------

Use the following command to open a bash session on the container. You can also replace bash with tcsh::

 docker pukk jeffersonlab/gemc:2.8
 docker run -it --rm jeffersonlab/gemc:2.8 bash

This will open the session in the /jlab/work directory.
Use the gemc option USE_GUI=0 to run gemc in batch mode.

|br|


Interactive mode (browser)
--------------------------

To use the native geant4 opengl GUI use the following command::

 docker run -it --rm -p 6080:6080 jeffersonlab/gemc:2.8

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
 - Shared mode active (this will ensure if you open another browser session, it will show the same instance of the container)
 - On the docker preferences try to make available as much memory as possible.

|br|

You can stop the docker container at any time using ctrl-c in the shell session you started it from.

|br|


Interactive mode (vnc)
----------------------

Use the following command to pass so you can open the container with the browser or a vnc client::

 docker run -it --rm -p 6080:6080 -p 5901:5901 jeffersonlab/gemc:2.8

You can now open localhost:5901 with your vnc client.

|br|



Native interactive mode (no opengl)
-----------------------------------

On a mac, if you allow access from localhost with::

  1. Activate the option ‘Allow connections from network clients’ in XQuartz settings
     (Restart XQuartz (to activate the setting)
  2. xhost +127.0.0.1

Then you can run docker and use the local X server with::

 docker run -it --rm -e DISPLAY=docker.for.mac.localhost:0 jeffersonlab/gemc:2.8 bash

You can run gemc in batch mode this way, but still enjoy the ability to open windows on the local host.

|br|


Mounting your directories to the container
------------------------------------------

The container will always start with the "pristine" image. In other words every work the the container filesystem will be lost when you exit docker.
You can use the option::

 -v /host/directory:/container/directory

to mount your local OS directories to be visible in docker. For example, to mount the "maximilian" home directory in a /max dir in the container:

 docker run -it --rm  -v /home/maximilian:/jlab/work/max jeffersonlab/gemc:2.8 bash

*/jlab/work//max* will now point to maximilian home dir. You can save work here.

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



Step-by-Step Installation
=========================

To run gemc / geant4 one can also download / install the libraries and gemc using these
`Step-By-Step instructions <https://www.jlab.org/12gev_phys/packages/sources/ceInstall/2.3_install.html>`_.




GEMC Release Notes
------------------
For release notes and the complete changelog see :ref:`release notes <releaseNotes>`.

|br| |br|






