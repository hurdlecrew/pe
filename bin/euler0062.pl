#!/usr/local/bin/perl
use strict;
use warnings;

my %cubes;
my $val = 0;
my $nor = 0;
for my $root (200..10000)  {
	$val = $root*$root*$root;
	$nor = join('', reverse sort split('', $val));
	push @{$cubes{$nor}}, $val;
	print "@{$cubes{$nor}}\n" if @{$cubes{$nor}} > 3;
}
	
