use strict;
use warnings;

our %configuration;


sub build_target
{
	my %detector = init_det();
	$detector{"name"}        = "target";
	$detector{"mother"}      = "root";
	$detector{"description"} = "Example of target";
	$detector{"color"}       = "880000";
	$detector{"type"}        = "Tube";
	$detector{"dimensions"}  = "0*cm 2*cm 2*mm 0*deg 360*deg";
	$detector{"material"}    = "G4_lH2";
	$detector{"style"}       = 1;
	print_det(\%configuration, \%detector);
}

