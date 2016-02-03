Cosmic Rays Generator
---------------------

A cosmic ray model can be used to generate cosmics in gemc.

The model is based on the parameterization [#]_:

.. math::
   \dfrac{a^{cos (b\theta)}}{cp^2}

The default parameters

.. math::
	a = 55.6 \\
	b = 1.04 \\
	c = 64.0

represent a fit to experimental data [#]_.


To use the default parameters the *COSMICRAYS* option can be used.
For example, to generate cosmic with momentum ranging from 1 to 10 GeV:


.. code-block:: bash

	<option name="COSMICRAYS"   value="default, 1, 10"/>


The above will generate an equal amount of positive and negative muons.

User can set the parameters as well. For example:

.. code-block:: bash

	<option name="COSMICRAYS"   value="55, 2, 66, 3, 4"/>

will set (a,b,c) to (55, 2, 66), and momentum range [3-4] GeV.

Target Area
^^^^^^^^^^^

By default the cosmic rays hit an area 50cm around (0,0,0).

The option *COSMICAREA* can be used to target a specific area and radius of interest.
For example:

.. code-block:: bash

	<option name="COSMICAREA"   value="0*cm, 0*cm, 1*m, 5*m"/>

will target an area at (0, 0, 1m) with 5m of radius.


.. container:: mydiv


.. thumbnail:: model.png
	:width: 48%
	:group: mycenter
	:title:

	The momentum versus theta distribution of muons using the default model parameters.



.. thumbnail:: example.png
	:width: 48%
	:group: mycenter
	:title:

	An example of 100 events with cosmic rays. The detector is the clas12 silicon vertex tracker.



.. rubric:: Footnotes

.. [#] \ \A. Dar, *Phys.Rev.Lett*, *51*,3,p.227 (1983)
.. [#] Harut Avakian, Jefferson Lab.

