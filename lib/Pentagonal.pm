package Pentagonal;

use strict;
use warnings;

use base 'Exporter';
our @EXPORT_OK = qw(
	&pentagonal
	&pentagonals
);

# n(3n-1)/2

sub pentagonal
{
	my $num = shift;
	$num = $num=~/^\d+$/ ? int($num) : return 0;

	my $squirt = sqrt(1+24*$num);
	if ($squirt == int $squirt)  {
		if ((1 - $squirt) % 6 == 0  and 1 - $squirt >= 0)  {
			return int((1-$squirt)/6);
		}  elsif ((1 + $squirt) % 6 == 0 and $squirt + 1 >= 0)  {
			return int((1+$squirt)/6);
		}
	}
	return 0;
}

sub pentagonals
{
	return map {int(($_*$_*3 - $_)/2)} @_;
}

1;

