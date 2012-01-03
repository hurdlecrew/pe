#!/usr/local/bin/perl

use strict;
use warnings;
use Test::More;

use_ok 'Triangle';

my %tests = (
    1 => 1,
    3 => 2,
    6 => 3,
   10 => 4,
   15 => 5,
    0 => 0,
   -1 => 0,
    K => 0,
  NaN => 0,
);

foreach my $number (sort keys %tests)  {
	is(Triangle::triangle($number), $tests{$number}, "Testing Triangle::triangle($number); expecting $tests{$number}");
}




done_testing();
1;
