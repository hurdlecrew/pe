#!/usr/local/bin/perl

use strict;
use warnings;
use Test::More;

use_ok 'Pandigital';

ok(Pandigital::pandigital(1), "Testing Pandigital::pandigital(1)");
ok(Pandigital::pandigital(12), "Testing Pandigital::pandigital(12)");
ok(Pandigital::pandigital(123), "Testing Pandigital::pandigital(123)");
ok(Pandigital::pandigital(1234), "Testing Pandigital::pandigital(1234)");
ok(Pandigital::pandigital(12345), "Testing Pandigital::pandigital(12345)");
ok(Pandigital::pandigital(123456), "Testing Pandigital::pandigital(123456)");
ok(Pandigital::pandigital(1234567), "Testing Pandigital::pandigital(1234567)");
ok(Pandigital::pandigital(12345678), "Testing Pandigital::pandigital(12345678)");
ok(Pandigital::pandigital(123456789), "Testing Pandigital::pandigital(123456789)");


ok(!Pandigital::pandigital(1234567890), "Testing Pandigital::pandigital(1234567890)");
ok(!Pandigital::pandigital(9), "Testing Pandigital::pandigital(9)");
ok(!Pandigital::pandigital(1223), "Testing Pandigital::pandigital(1223)");
ok(!Pandigital::pandigital('X'), "Testing Pandigital::pandigital('X')");
ok(!Pandigital::pandigital(0), "Testing Pandigital::pandigital(0)");


done_testing();

1;
