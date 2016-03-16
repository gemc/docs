use strict;
use warnings;

our %configuration;

sub materials
{
	# Scintillator
	my %mat = init_mat();
	$mat{"name"}          = "myFirstscintillator";
	$mat{"description"}   = "simple scintillator material";
	$mat{"density"}       = "1.032";  # in g/cm3
	$mat{"ncomponents"}   = "2";
	$mat{"components"}    = "C 9 H 10";
	print_mat(\%configuration, \%mat);
}


