#!/usr/bin/perl

use strict;
use warnings;

=pod
The sum of the squares of the first ten natural numbers is,
1^(2) + 2^(2) + ... + 10^(2) = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)^(2) = 55^(2) = 3025

Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

=cut

my $sum = 0;
my $sum_of_squares = 0;

for my $i (1..100) {
  $sum += $i;
  $sum_of_squares += $i * $i
}

print($sum * $sum - $sum_of_squares, "\n");


