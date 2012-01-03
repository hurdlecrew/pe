package Pandigital;

use strict;
use warnings;
use base qw(Exporter);

our @EXPORT_OK = qw(pandigital);

sub pandigital
{
	my $num = shift;
	return 0 if $num =~ /[^\d+]/;
	my $len = scalar split //,  $num;
	foreach my $i (1..$len)  {
		return 0 if index($num, $i) < 0;
	}
	return 1;
}

1;
