package Triangle;

use strict;
use warnings;

use base 'Exporter';
our @EXPORT_OK = qw(
	&triangle
	&triangles
);



sub triangle
{
	my $num = shift;
	$num = $num=~/^\d+$/ ? int($num) : return 0;

	my $squirt = sqrt(8*$num + 1);
	if ($squirt == int $squirt)  {
		if ((-1 - $squirt) % 2 == 0  and -1 - $squirt >= 0)  {
			return int((-1-$squirt)/2);
		}  elsif ((-1 + $squirt) % 2 == 0 and $squirt - 1 >= 0)  {
			return int((-1+$squirt)/2);
		}
	}
	return 0;
}

sub triangles
{
	return map {int(($_*$_*3 - $_)/2)} @_;
}

1;

