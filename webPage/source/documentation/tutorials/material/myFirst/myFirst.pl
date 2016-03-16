#!/usr/bin/perl -w

# loading GEMC geometry routines
use strict;
use lib ("$ENV{GEMC}/api/perl");
use utils;
use geometry;
use materials;

# Define the Help Message
sub help()
{
	print "\n Usage: \n";
	print "   myFirst.pl <configuration filename>\n";
 	print "   Will create a target and a paddle using the variation specified in the configuration file\n";
	exit;
}

# Make sure the argument list is correct
# If not pring the help
if( scalar @ARGV != 1)
{
	help();
	exit;
}

# Loading configuration file
our %configuration = load_configuration($ARGV[0]);


# target geometry
require "./target.pl";

# paddle geometry
require "./paddle.pl";


# Let's create two configurations, "short" and "long"
my @allConfs = ("short", "long");

foreach my $conf ( @allConfs )
{
	$configuration{"variation"} = $conf ;
	
	# geometry
	build_simple_paddle();
	build_target();
}

