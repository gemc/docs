Cosmic Rays Generator
---------------------

Muons
-----

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

User can set the parameters as well. For example::

	<option name="COSMICRAYS"   value="55, 2, 66, 3, 4"/>

will set (a,b,c) to (55, 2, 66), and momentum range [3-4] GeV.



Neutrons
--------

Neutrons are selected by the 4th field in the COSMICRAYS data card,
corresponding to the type of cosmic ray particle: muon || neutron. Default (null string): muon is selected.

Generation of neutron cosmic rays:

The vertical distribution of cosmic neutrons is described by
:math:`j(E) dE \sim E^{-\gamma}dE` with :math:`\gamma = 2.95 \pm 10` (from a fit of data by several
experiments by Ashton et al. (Cosmic rays at ground level (1973), updated by Nature 256, 387 (1975), see picture).


.. thumbnail:: neutrons.jpg
	:width: 78%
	:group: mycenter


The zenith angle dependence is given by :math:`I(\theta) = I(0)*cos^n(\theta)` with :math:`\theta = 3.5 \pm 1.2` (from Heidbreder et al., J. Geophys. Pres. 76, 2905 (1971))


Target Area
-----------

By default the cosmic rays hit an area 50cm around (0,0,0).

The option *COSMICAREA* can be used to target a specific area and radius of interest.
For example::

 <option name="COSMICAREA"   value="0*cm, 0*cm, 1*m, 5*m"/>

will target an area at (0, 0, 1m) with 5m of radius.



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


Source Area
------------
Be default the particles are generated on a sphere with radius specified by the *COSMICAREA* option.
The *COSMICAREA* can have an additional argument to generate the cosmics on a cylinder instead. For example::

 <option name="COSMICAREA"   value="0*cm, 0*cm, 1*m, 5*m"/>

will generate cosmics on a cylinder with radius 5m and height 2.5m (half the radius).

|

.. rubric:: Footnotes

.. [#] \ \A. Dar, *Phys.Rev.Lett*, *51*,3,p.227 (1983)
.. [#] Harut Avakian, Jefferson Lab.

