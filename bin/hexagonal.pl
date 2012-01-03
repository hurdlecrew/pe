#!/usr/local/bin/perl
use strict;
use warnings;
use lib '.';
use Hexagonal qw(hexagonal);

my $arg = shift;
print "$arg is " . (Hexagonal::hexagonal($arg) ? '' : 'NOT ') . "hexagonal\n";
