#!/usr/local/bin/perl

use strict;
use warnings;
use Test::More;

use_ok 'Pentagonal';

my %tests = (
    1 => 1,
    5 => 2,
   12 => 3,
   22 => 4,
   35 => 5,
   51 => 6,
   70 => 7,
   92 => 8,
  117 => 9,
  145 => 10,
    0 => 0,
   -1 => 0,
    K => 0,
  NaN => 0,
);

foreach my $number (sort keys %tests)  {
	is(Pentagonal::pentagonal($number), $tests{$number}, "Testing Pentagonal::pentagonal($number); expecting $tests{$number}");
}




done_testing();
1;
