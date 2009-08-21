#!/usr/bin/perl -w

use strict;
use warnings;
use Math::Primality qw/is_prime/;
$|++;

my $limit = shift || 2_000_000;
my $sum = 5; # 2 + 3
my @nums = grep { $_ % 2 != 0 } (5..$limit);
map { $sum += $_ if is_prime($_) } @nums;

print "sum of first $limit primes = $sum\n";
