
###################
Vertex Manipulation
###################

.. _vertex:


The generator event vertex can be manipulated in the following ways:


.. _target_length_and_position:

Target length and position
==========================

The option RANDOMIZE_LUND_VZ randomizes the z vertexes using, in order: Z shift, DZ sigma.
By default the randomization is relative to the LUND vertex values.
If the third argument "reset" is given, the vertexes are relative to VZ=0.


Example1: preserving LUND vertices:
-----------------------------------

.. code-block:: bash

    -RANDOMIZE_LUND_VZ="-3*cm, 2.5*cm"


This randomizes the z vertex by plus-minus 2.5cm around the original LUND values, and applies a shift it of -3cm


Example2: resetting to VZ=0:
-----------------------------

.. code-block:: bash

    -RANDOMIZE_LUND_VZ="-3*cm, 2.5*cm, reset"

This randomizes the z vertex by plus-minus 2.5cm around VZ = -3cm




.. _beam_spot:

Beam spot
=========

To randomizes the x, y generated particle vertex in an ellipse defined by the x, y radii and sigmas the option BEAM_SPOT can be used.
By default, the shift is relative to the original LUND vertex values. The last parameter defines the ellipse counterclockwise rotation along the z-axis.
If a sixth argument “reset” is given, the vertexes are relative to (VX, VY) = (0, 0)

Example1: preserving LUND vertices:
-----------------------------------

.. code-block:: bash

    -BEAM_SPOT="2*cm, 3*cm, 0.2*cm, 0.1*cm, 22*deg"

This randomizes the vertexes around the original LUND values, but shifted by (VX, VY) = (2, 3) cm.
A gaussian with sigmas (SX, SY) = (0.2, 0.1) cm are used, and the ellipse is rotated 22 degrees around z.


Example2: resetting to (VX, VY) = (0, 0):
-----------------------------------------

.. code-block:: bash

    -BEAM_SPOT="2*cm, 3*cm, 0.2*cm, 0.1*cm, 22*deg, reset"

Same as above except the randomization is directly applied around (VX, VY) = (2, 3)cm.


.. _raster:

Raster
======

The raster option RASTER_VERTEX randomizes the x, y generated partice vertexes in an ellipse defined by the x, y radii, around their values.
If the third argument "reset" is given, the vertexes are centered at zero

Example1: preserving LUND vertices:
-----------------------------------

.. code-block:: bash

    -RASTER_VERTEX="2*cm, 3*cm"

This randomizes the vertexes around the original LUND values, but shifted by (VX, VY) = (2, 3) cm.

Example2: resetting to (VX, VY) = (0, 0):
-----------------------------------------

.. code-block:: bash

    -RASTER_VERTEX="2*cm, 3*cm, reset"

This randomizes the vertexes around (VX, VY) = (0, 0) cm.


