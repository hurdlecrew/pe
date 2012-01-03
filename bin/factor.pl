#!/usr/local/bin/perl
use strict;
use warnings;
use Factor qw(divisors);

local $, = ' ';
print divisors(shift);
print "\n";
