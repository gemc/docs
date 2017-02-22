.. _ions:

Generating ions
---------------

ions can be generated with the options ION_P to sets Z, A and Charge State of the primary particle. Setting the charge state is optional.

- Example 1: -ION_P="6 12" sets the Z to 6, A to 12. Charge will be Z.
- Example 2: -ION_P="6 12 4" sets the Z to 6, A to 12, and charge to 4.
- Notice: BEAM_P still sets the particle momentum, and its type must be GenericIon. For example:

  -BEAM_P="GenericIon, 4*GeV, 90*deg, 0*deg"






.. rubric:: Footnotes

.. [#] See also :ref:`gemcOption`.













