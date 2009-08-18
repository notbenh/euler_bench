#!/usr/bin/perl
use strict;
use warnings;

=pod
Each new term in the Fibonacci sequence is generated by adding the previous two terms. By starting with 1 and 2, the first 10 terms will be:

1, 2, 3, 5, 8, 13, 21, 34, 55, 89, ...

Find the sum of all the even-valued terms in the sequence which do not exceed four million.
=cut

my @_fib = (1,1);
sub fib {
   my $n = shift;
   return $_fib[$n] if $_fib[$n];
   $_fib[$n] = fib($n-1) + fib($n-2);
}

my $i = 2; # we really could start anywhere but we know that 1 = 1 and it's not even
my $sum = 0;
while ((my $f = fib($i++)) < 4000000) {
   $sum += $f unless $f %2;
}
print $sum;
