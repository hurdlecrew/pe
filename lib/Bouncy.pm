package Bouncy;

use strict;
use warnings;
use base qw(Exporter);

our @EXPORT_OK = qw(bouncy);

our $REPEATER = 1;


################################################################################
sub increasing
{
   my @num = split //, shift;
   while (@num > 1)  {
      return 0 if $num[0] > $num[1];
      shift;
   }
   return 1;
}
################################################################################

################################################################################
sub decreasing
{
   return increasing( join('', (reverse split //, shift) ) );
}
################################################################################

sub bouncy
{
	my @num = split //, shift;
	my $slope = 0;
	my @copy  = @num;
	my $point = shift @num;
	while (@num)  {
		if ($point < $num[0])  {
			$point = $slope < 0 ? (return 0) : shift @num;
			$slope = 1;
		}  elsif ($point > $num[0])  {
			$point = $slope > 0 ? (return 0) : shift @num;
			$slope = -1;
		}  else  {
			$point = shift @num;
		}
	}
	return $REPEATER if $slope == 0 and $copy[0] == $copy[-1];
	return $slope;
}


1;

__END__

=head1 NAME

Bouncy.pm - Utilities for determining the bouncy-ness of numbers

=head1 SYNOPSIS

    use Bouncy qw( increasing decreasing bouncy );
    print "$num is increasing\n" if increasing($num);
    print "$num is decreasing\n" if decreasing($num);
    print "$num is bouncy\n" if not increasing($num) and not decreasing($num);

    # or a better way:

    my %str = ('-1'=>'decreasing', '0'=>'bouncy', '1'=>'increasing');
    $str{$Bouncy::REPEATER} = 'all the same repeated digits' unless exists $str{$Bouncy::REPEATER};
    print "$num is " . $str{ bouncy($num) } . "\n";

=head1 DESCRIPTION

    Any number n with digits abcde... in which a <= b <= c <= d <= ... is said to be increasing.  If a >= b >= c >= d >= ..., then n is said to be decreasing.  If n is neither increasing nor decreasing, then n is said to be "bouncy".

=head2 increasing($n)

Returns true if the given numeric argument is increasing; false otherwise.  Numbers that consist entirely of a single repeated digit, such as 55555, are considered to be increasing.

=head2 decreasing($n)

Returns true if the given numeric argument is decreasing; false otherwise.  Numbers that consist entirely of a single repeated digit, such as 55555, are considered to be decreasing.

=head2 bouncy($n)

Determines if a given numerical input is either decreasing, bouncy, or increasing and returns either -1, 0, or 1 respectively (analogous to the core I<cmp> operator.  Numers that consist entirely of a single repeated digit, such as 55555, in this case are considered to be increasing, thus causing bouncy() to return 1.  This is configurable by setting the $Bouncy::REPEATER variable to the desired return value.

=cut


Clearly there cannot be any bouncy numbers below one-hundred, but just over half of the numbers below one-thousand (525) are bouncy. In fact, the least number for which the proportion of bouncy numbers first reaches 50% is 538.

Surprisingly, bouncy numbers become more and more common and by the time we reach 21780 the proportion of bouncy numbers is equal to 90%.

Find the least number for which the proportion of bouncy numbers is exactly 99%.
