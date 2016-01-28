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

Typing gemc -help will show the help sub-categories::

 Help Options:

 >  -help-all:  all available options.

 >  -help-control             control options.
 >  -help-general             general options.
 >  -help-generator           generator options.
 >  -help-luminosity          luminosity options.
 >  -help-mysql               mysql options.
 >  -help-output              output options.
 >  -help-physics             physics options.
 >  -help-verbosity           verbosity options.

You can access to a specific subcategory like this::

 gemc -help-control


Gcard
-----

The syntax of the gcard options is::

 <option name="OPTION"   value="argument"/>

For example, to set the primary particle momentum as above::

 <option name="BEAM_P"   value="proton, 4.0*GeV, 20.0*deg, 10*deg"/>


.. note::

   All command line options can be used in the gcard and viceversa.
