.. _gemcOption:

############
GEMC Options
############

Option can be passed to gemc by command line and/or a **gcard** file (XML format).


Command Line Options
--------------------

The syntax of the gemc command line options is::

   -OPTION="argument"

For example, to set the primary particle momentum::

   -BEAM_P="proton, 4.0*GeV, 20.0*deg, 10*deg"

Unless the argument is a single word, quotes are necessary.

Some options support multiple instances. For example, one could scale several fields with the SCALE_FIELD option::

 -SCALE_FIELD="field1, 0.6"
 -SCALE_FIELD="field2, -1"


Typing gemc -help will show the help sub-categories::


 Help Options:

  >  -help-all:  all available options.
  >  -help-html:  write a formatted file options.html with the available gemc options.

   >  -help-control             control options.
   >  -help-fields              fields options.
   >  -help-general             general options.
   >  -help-generator           generator options.
   >  -help-luminosity          luminosity options.
   >  -help-materials           materials options.
   >  -help-mysql               mysql options.
   >  -help-output              output options.
   >  -help-physics             physics options.
   >  -help-transportation      transportation options.
   >  -help-verbosity           verbosity options.

You can access to a specific subcategory like this:

.. code-block:: bash

 gemc -help-control


Gcard
-----

The syntax of the gcard options is:

.. code-block:: bash

 <option name="OPTION"   value="argument"/>

For example, to set the primary particle momentum as above:

.. code-block:: bash

 <option name="BEAM_P"   value="proton, 4.0*GeV, 20.0*deg, 10*deg"/>


.. note::

 All command line options can be used in the gcard and viceversa. The command line will superseed the gcard. When doing so,
 the option multiplicity is reset (i.e. if SCALE_FIELD is used in the gcard and the command line, only the command line option
 will be used.

.. note::

 All the options are saved in the output stream.

|

List of all the current GEMC options
------------------------------------

.. raw:: html

   <div style="margin-top:10px;">
   	<iframe width="140%" height="10000" src="allOptions.html" frameborder="0" ></iframe>
   </div>





