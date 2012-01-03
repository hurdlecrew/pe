package Factor;

use strict;
use warnings;

use base 'Exporter';
our @EXPORT_OK = qw(
	divisors
	squarefree
);


sub divisors
{
	my $num = shift;
	my $orig = $num;
	my $squirt = sqrt $num;
	my $factor = 2;
	my @factors = ();

	return () if $num == 0;


	while ($num % 2 == 0)  {
		push @factors, 2;
		$num = int($num / 2);
	}

	$factor++;
	while ($num > 1 and $factor <= $squirt)  {
		while ($num % $factor == 0)  {
			push @factors, $factor;
			$num = int($num / $factor);
		}
		$factor += 2;
	}

	push @factors, (@factors ? ($num > 1 ? $num : ()) : $orig);
	return @factors;
}


sub squarefree
{
	my %divs = ();
	if (@_ == 1)  {
		my $num = shift;
		map { $divs{$_}++; return 0 if $divs{$_} > 1 } divisors($num);
	}  else  {
		map { $divs{$_}++; return 0 if $divs{$_} > 1 } @_;
	}	
	return 1;
}


1;

