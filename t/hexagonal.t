#!/usr/local/bin/perl

use strict;
use warnings;
use Test::More;

use_ok 'Hexagonal';

my %tests = (
    1 => 1,
    6 => 2,
   15 => 3,
   28 => 4,
   45 => 5,
    0 => 0,
   -1 => 0,
    K => 0,
  NaN => 0,
);

foreach my $number (sort keys %tests)  {
	is(Hexagonal::hexagonal($number), $tests{$number}, "Testing Hexagonal::hexagonal($number); expecting $tests{$number}");
}




done_testing();
1;
