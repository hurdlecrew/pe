package Lycherel;

use strict;
use warnings;
use Math::BigInt;
use Palindrome qw(palindrome10);
use base qw(Exporter);

our @EXPORT_OK = qw(lycherel);

my $RECURSION_LIMIT = 50;

sub lycherel
{
	my $number = shift;
	my $level = shift // 1;

	unless (ref $number eq 'Math::BigInt')  {
		$number = Math::BigInt->new($number);
	}

	## Assume lycherel if we hit the recursion limit
	return 1 if $level == $RECURSION_LIMIT;

	my $reversal = Math::BigInt->new(join '', reverse split //, $number);
	$reversal->badd($number);

	return if palindrome10($reversal);

	return lycherel($reversal, $level+1);
}
	


1;
