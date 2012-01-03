package Palindrome;

use strict;
use warnings;
use base qw(Exporter);

our @EXPORT_OK = qw(palindrome2 palindrome10);

################################################################################
# palindrome2(num)
#   Determine whether the (base 10) number num is a palindrome in binary
sub palindrome2
{
    my $num = sprintf("%b", shift);
    $num =~ s/^0+//g;
    return palindrome10($num);
}
################################################################################

################################################################################
# palindrome10(num)
#   Determine whether the (base 10) number num is a palindrome (base 10).
sub palindrome10
{
    my @num = split(//, shift);
    my $half = int @num / 2;

    for my $i (0..($half-1))  {
        if ($num[$i] != $num[@num-1-$i])  {
            return 0;
        }
    }
    return 1;
}
################################################################################

1;
