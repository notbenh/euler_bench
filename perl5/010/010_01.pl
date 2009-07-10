#!/usr/bin/perl -w

use strict;
use warnings;
use Math::Primality qw/is_prime/;
$|++;

my $limit = shift || 2_000_000;
my $sum = 5; # 2 + 3

for my $n (5..$limit) {
    next unless ( $n % 2 );     # don't check even numbers
    $sum += $n if is_prime($n);
}
print "sum of first $limit primes = $sum\n";
