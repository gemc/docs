use strict;
use warnings;

our %configuration;

sub build_simple_paddle
{
	my %detector = init_det();
	$detector{"name"}        = "paddle_1";
	$detector{"mother"}      = "root";
	$detector{"description"} = "Example of paddle";
	$detector{"pos"}         = "0*cm 0*cm 30*cm";
	$detector{"rotation"}    = "0*deg 0*deg 0*deg";
	$detector{"color"}       = "339999";
	$detector{"type"}        = "Box";
	
	if($configuration{"variation"} eq "short") { $detector{"dimensions"}  = "2*cm 2*cm  4*cm"; }
	if($configuration{"variation"} eq "long")  { $detector{"dimensions"}  = "2*cm 2*cm 10*cm"; }
	
	$detector{"material"}    = "G4_GLASS_LEAD";
	$detector{"style"}       = 1;
	print_det(\%configuration, \%detector);
}

