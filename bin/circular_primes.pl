#!/usr/local/bin/perl

use strict;
use warnings;

my $limit = shift;
my %hash;

ITERATOR:
foreach my $n (1..$limit)  {
	next ITERATOR if $n =~ /0|2|4|5|6|8/;
	next ITERATOR if digitsum($n) % 3 == 0;
	$hash{$n}++ if is_prime($n) and popoff($n);
}


$hash{2}++;
$hash{3}++;
$hash{5}++;

local $, = "\n";
print keys %hash;







sub popoff
{
	my $n = shift;
	my @n = split //, $n;
	my $popnext = join('', $n[-1], @n[0..$#n-1]);
	return unless is_prime($popnext);
	my @popnext = split //, $popnext;
	$popnext = join('', $popnext[-1], @popnext[0..$#popnext-1]);
	return unless is_prime($popnext);
	@popnext = split //, $popnext;
	$popnext = join('', $popnext[-1], @popnext[0..$#popnext-1]);
	return unless is_prime($popnext);
	@popnext = split //, $popnext;
	$popnext = join('', $popnext[-1], @popnext[0..$#popnext-1]);
	return unless is_prime($popnext);
	@popnext = split //, $popnext;
	$popnext = join('', $popnext[-1], @popnext[0..$#popnext-1]);
	return unless is_prime($popnext);
	@popnext = split //, $popnext;
	$popnext = join('', $popnext[-1], @popnext[0..$#popnext-1]);
	return unless is_prime($popnext);
	@popnext = split //, $popnext;
	$popnext = join('', $popnext[-1], @popnext[0..$#popnext-1]);
	return unless is_prime($popnext);
	@popnext = split //, $popnext;
	$popnext = join('', $popnext[-1], @popnext[0..$#popnext-1]);
	return unless is_prime($popnext);
	return 1;
}

sub digitsum
{
	my $i = shift;
	my @i = split //, $i;
	my $sum = 0;
	foreach my $j (@i)  {
		$sum += $j;
	}
	return $sum;
}

sub is_prime
{
	my $n = shift;
	foreach my $i (2,3..int(sqrt($n)+1))  {
		if ($n % $i == 0)  {
			return 0;
		}
	}
	return 1;
}
