.. |br| raw:: html

   <br>

.. _lund:



The LUND format
---------------

gemc can read the LUND format.

It is a text format. Its header defines quantities such as the number N of generated particle
for each event and other kinematic properties.

Use in gemc with the option::

 -INPUT_GEN_FILE="LUND, input.dat"

Or, in a gcard [#]_::

 <option name="INPUT_GEN_FILE" value="LUND, input.dat"/>


|br|

Description
^^^^^^^^^^^

The header must contain at least 10 variables, listed below. Additional information can be
added to the header, up to 100 variables. The header is separated from the data by a blank line.

After the header there are N lines (one per particle) describing each particle
property as described in the tables below.

A **bold** indicates quantities used by GEMC. The other variables are labelled UD (for used designed).
The UD variables are not used by GEMC but are kept in the output stream. In the table below
the UD variables are an example from the JLab CLAS12 conventions, but users can assign any meaning to them.

|br|

Note: the particle **index** starts from 1.

|br|

.. container:: lmydiv

   +------------------------------------------------------------------------+
   |          LUND Header                                                   |
   +--------------+---------------------------------------------------------+
   |   column     |                 quantity                                |
   +--------------+---------------------------------------------------------+
   |      1       |       **Number of particles**                           |
   +--------------+---------------------------------------------------------+
   |      2       | Mass number of the target (UD)                          |
   +--------------+---------------------------------------------------------+
   |      3       | Atomic number oif the target (UD)                       |
   +--------------+---------------------------------------------------------+
   |      4       | Target polarization  (UD)                               |
   +--------------+---------------------------------------------------------+
   |      5       |      **Beam Polarization**                              |
   +--------------+---------------------------------------------------------+
   |      6       | Beam type, electron=11, photon=22" (UD)                 |
   +--------------+---------------------------------------------------------+
   |      7       | Beam energy (GeV)  (UD)                                 |
   +--------------+---------------------------------------------------------+
   |      8       | Interacted nucleon ID (2212 or 2112)  (UD)              |
   +--------------+---------------------------------------------------------+
   |      9       | Process ID (UD)                                         |
   +--------------+---------------------------------------------------------+
   |      10      | Event weight (UD)                                       |
   +--------------+---------------------------------------------------------+
   |      11-100  | Optional array: any int or double.                      |
   +--------------+---------------------------------------------------------+

.. container:: rmydiv


   +---------------------------------------------------------------------+
   |          LUND Particles                                             |
   +--------------+------------------------------------------------------+
   |   column     |                 quantity                             |
   +--------------+------------------------------------------------------+
   |      1       |       **index**                                      |
   +--------------+------------------------------------------------------+
   |      2       |  Lifetime [nanoseconds] (UD)                         |
   +--------------+------------------------------------------------------+
   |      3       |    **type (1 is propagated in geant4, 0 is not)**    |
   +--------------+------------------------------------------------------+
   |      4       |     **particle ID**                                  |
   +--------------+------------------------------------------------------+
   |      5       |  Index of the parent (UD)                            |
   +--------------+------------------------------------------------------+
   |      6       |  Index of the first daughter (UD)                    |
   +--------------+------------------------------------------------------+
   |      7       |             **momentum x   [GeV]**                   |
   +--------------+------------------------------------------------------+
   |      8       |             **momentum y   [GeV]**                   |
   +--------------+------------------------------------------------------+
   |      9       |             **momentum z   [GeV]**                   |
   +--------------+------------------------------------------------------+
   |      10      |  Energy of the particle [GeV] (UD)                   |
   +--------------+------------------------------------------------------+
   |      11      |  Mass of the particle [GeV] (UD)                     |
   +--------------+------------------------------------------------------+
   |      12      |          **vertex x [cm]**                           |
   +--------------+------------------------------------------------------+
   |      13      |          **vertex y [cm]**                           |
   +--------------+------------------------------------------------------+
   |      14      |          **vertex z [cm]**                           |
   +--------------+------------------------------------------------------+


Vertex
^^^^^^


As reminder, GEMC does not change the LUND vertex location based on the location or dimension of physical volumes (for example, a target).

The following options can be used to account for a beam spot or target dimensions:

|br|

- **BEAM_SPOT**:

Randomizes the x, y generated particle vertex shifts in an ellipse defined by the x, y radii and sigmas. An additional parameters defines the ellipse counterclockwise rotation along the z-axis.

By default the shift is relative to the original LUND vertex values.
If a sixth argument “reset” is given, the vertexes are relative to (VX, VY) = (0, 0)

           - example 1 (preserves LUND original vertices): -BEAM_SPOT="2*cm, 3*cm, 0.2*cm, 0.1*cm, 22*deg"
             
             This randomizes the vertexes around the original LUND values, but shifted by (VX, VY) = (2, 3) cm.
             A gaussian with sigmas (SX, SY) = (0.2, 0.1) cm are used, and the ellipse is rotated 22 degrees around z.


           - example 2: -BEAM_SPOT="2*cm, 3*cm, 0.2*cm, 0.1*cm, 22*deg, reset"
             
             Same as above except the randomization is directly applied around (VX, VY) = (2, 3)cm.
             
             
- **RANDOMIZE_LUND_VZ**:

Randomizes the z vertexes using, in order: Z shift, DZ sigma.
By default the randomization is relative to the LUND vertex values. If the third argument "reset" is given, the vertexes are relative to VZ=0.

           - example 1 (preserves LUND original vertices):  -RANDOMIZE_LUND_VZ="-3*cm, 2.5*cm"
             
             Randomizes the z vertex by plus-minus 2.5cm around the original LUND values, and applies a shift it of -3cm

           - example 2:  -RANDOMIZE_LUND_VZ="-3*cm, 2.5*cm, reset "
             
             Randomizes the z vertex by plus-minus 2.5cm around VZ = -3cm

|br|
|br|

In the pictures below the vertex was placed at -3cm and a beam spot was assigned with these options::

   <option name="BEAM_SPOT"  value="0.2*cm, 0.3*cm, 0.05*cm, 0.1*cm, 20*deg"/>
   <option name="RANDOMIZE_LUND_VZ"  value="-3*cm, 2.5*cm, reset"/>

.. thumbnail:: lundBeamSpot.png
   :width: 48%
   :group: mycenter
   :title:

.. thumbnail:: lundZshift.png
   :width: 48%
   :group: mycenter
   :title:



|br|




Examples
^^^^^^^^

1 DVCS events (eP𝜋0𝛾)::

 4   1   1    0.0   0.0 11   10.600   1       1      0.2373006E-02
 1  -1.  1     11   0    0  -0.9830   0.0981  9.6502  9.7007  0.0005  0.0000 0.0000  -0.8072
 2   1.  1   2212   0    0   0.7333   0.1126  0.6391  1.3560  0.9380  0.0000 0.0000  -0.8072
 3   0.  1    111   0    0   0.2498  -0.2107  0.2808  0.4515  0.1349  0.0000 0.0000  -0.8072
 4   0.  1     22   0    0  -0.0001  -0.0000  0.0299  0.0299  0.0000  0.0000 0.0000  -0.8072

|br|


Lund to ROOT
^^^^^^^^^^^^

A convenience root conversion macro for lund format can be found `here <https://github.com/rafopar/clas12AnaTools/tree/master/LUND2Root>`_.



|br|
|br|







.. rubric:: Footnotes

.. [#] See also :ref:`gemcOption`.













