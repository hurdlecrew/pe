package Combination;

use strict;
use warnings;
use Carp;
use Factor qw(divisors);

use base 'Exporter';
our @EXPORT_OK = qw(
	C
);

my $DEBUG = 1;

sub C
{
	my $num = shift;
	my $den = shift;

	return (wantarray ? (1) : 1) if $num == 0 or $den == 0;
	croak "C($num, $den) is impossible" if $num < $den;

	my %num = ();
	foreach my $n (2..$num)  {
		foreach my $divisor (divisors($n))  {
			$num{$divisor}++;
		}
	}

	my %den = ();
	foreach my $d (2..$den,2..($num-$den))  {
		foreach my $divisor (divisors($d))  {
			$den{$divisor}++;
		}
	}

	foreach my $divisor (keys %den)  {
		$num{$divisor} -= $den{$divisor};
		delete $num{$divisor} if $num{$divisor} == 0;
	}

	if (wantarray)  {
		my @ret = ();
		map { while ($num{$_} > 0) { push @ret, $_; $num{$_}--; } } keys %num;
		return sort {$a <=> $b} @ret;
	}  else  {
		my $ret = 1;
		map {$ret *= $_ ** $num{$_}} keys %num;
		return $ret;
	}
}

1;

