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

__END__

=head1 NAME

Triangle.pm - Utilities for dealing with triangle numbers

=head1 SYNOPSIS

    use Triangle qw( triangle triangles );
    print "$n is triangle!" if triangle($n);
    my @first_100_triangles = triangles(1..100); 

=head1 DESCRIPTION

    A triangle number is an integer having the form t(n) = (3n^2-n)/2 = n(3n-1)/2. The first few hexabonal numbers are 1, 5, 12, 22, 35.  This module includes the following utilities for dealing with them:

=head2 hexagonal($n)

    Test for hexagonality, that is, hexagonal(45) returns a true value, but hexagonal(44) returns a false value.

=head2 hexagonals(@list)

    For a given list of integers, return the corresponding list of hexagonal numbers.  For example, hexagonals(1,2,3,4,5) will return the list (1,6,15,28,45).

=cut
