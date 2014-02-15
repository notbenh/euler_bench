#!/usr/bin/perl

use warnings;
use strict;
use List::Util qw/max/;
use Memoize;

my $number = shift || 600851475143;

sub is_prime($) {
    my ($n) = @_;
    for my $i (2 .. int(sqrt($n))) {
        return 0 if ($n % $i == 0);
    }
    return 1;
}

memoize('prime_factors');

sub prime_factors($) {
    my ($n) = @_;
    my @factors = ();

    if ($n <= 3 or is_prime($n)) {
        push @factors, $n;
        return @factors;
    }
    for my $i (4 .. int(sqrt($n))) {
        if ($n % $i == 0) {
            no warnings;
            push @factors, prime_factors($i);
        }
    }

    return @factors;
}

my @prime_factors = prime_factors($number);
#print "Prime factors of $number are @prime_factors\n";

my $largest = max(@prime_factors);
#print "Largest prime factor of $number is $largest\n";
print "$largest\n";

