#!/usr/local/bin/perl

use strict;
use warnings;
use Test::More;

use_ok 'Combination';
use Combination qw( C );


is( C(0,0)    , 1, "C(0,0)" );
is( C(1,0)    , 1, "C(0,0)" );
is( C(0,1)    , 1, "C(0,0)" );
is( C(100,0)  , 1, "C(0,0)" );


is( C(7,1)  , 7, "C(7,1)" );
is( C(4,2)  , 6, "C(4,2)" );
is( C(10,7) , 120, "C(10,7)");
my @e = (2,2,2,3,5);
my @g = C(10,7);
is_deeply(\@g, \@e, "C(10,7) (list context)");
done_testing();

1;
