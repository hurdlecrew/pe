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

__END__

=head1 NAME

Hexagonal.pm - Utilities for dealing with hexagonal numbers

=head1 SYNOPSIS

    use Hexagonal qw( hexagonal hexagonals );
    print "$n is hexagonal!" if hexagonal($n);
    my @first_100_hexagonals = hexagonals(1..100); 

=head1 DESCRIPTION

    A hexagonal number is an integer having the form h(n) = 2n^2-n = n(2n-1). The first few hexabonal numbers are 1, 6, 15, 28, 45.  This module includes the following utilities for dealing with them:

=head2 hexagonal($n)

    Test for hexagonality, that is, hexagonal(45) returns a true value, but hexagonal(44) returns a false value.

=head2 hexagonals(@list)

    For a given list of integers, return the corresponding list of hexagonal numbers.  For example, hexagonals(1,2,3,4,5) will return the list (1,6,15,28,45).

=cut
