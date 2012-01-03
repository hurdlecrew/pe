package Hexagonal;

use strict;
use warnings;

use base 'Exporter';
our @EXPORT_OK = qw(
	&hexagonal
	&hexagonals
);



sub hexagonal
{
	my $num = shift;
	$num = $num=~/^\d+$/ ? int($num) : return 0;

	my $squirt = sqrt(8*$num + 1);
	if ($squirt == int $squirt)  {
		if ((1 - $squirt) % 4 == 0  and 1 - $squirt >= 0)  {
			return int((1-$squirt)/4);
		}  elsif ((1 + $squirt) % 4 == 0 and $squirt + 1 >= 0)  {
			return int((1+$squirt)/4);
		}
	}
	return 0;
}

sub hexagonals
{
	return map {$_*$_*2 - $_} @_;
}

1;

