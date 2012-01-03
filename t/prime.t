#!/usr/local/bin/perl

use strict;
use warnings;
use Test::More;

use_ok 'Prime';

my $p = \&Prime::prime;

ok( $p->(2), 'prime(2)' );
ok( !$p->(4), 'prime(4)' );
ok( !$p->(20), 'prime(20)' );
ok( $p->(29), 'prime(29)' );
ok( $p->(11), 'prime(11)' );
ok( $p->(101), 'prime(101)' );


done_testing();

1;
