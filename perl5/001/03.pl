#!/usr/bin/env perl
use strict;
use warnings;

=pod

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get
3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

=cut

my $sum = 0;
map { $sum += $_ if($_ % 3 == 0 || $_ % 5 == 0)} (1..999);
print "$sum\n";

