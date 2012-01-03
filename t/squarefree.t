#!/usr/local/bin/perl

use strict;
use warnings;
use Test::More;

use_ok 'Factor';

my $s = \&Factor::squarefree;

ok( !$s->(2), 'squarefree(2)' );
ok( $s->(4), 'squarefree(4)' );
ok( $s->(20), 'squarefree(20)' );
ok( !$s->(29), 'squarefree(29)' );
ok( !$s->(11), 'squarefree(11)' );
ok( !$s->(101), 'squarefree(101)' );

ok( !$s->(1), 'squarefree(1)' );
ok( $s->(11,11), 'squarefree(11,11)' );
ok( !$s->(2,3), 'squarefree(2,3)' );
ok( !$s->("steve"), 'squarefree("steve")' );
ok( !$s->(0), 'squarefree(0)' );
ok( $s->(2,3,5,7,11,2,7,13,17), 'squarefree(2,3,5,7,11,2,7,13,17)' );

done_testing();

1;
