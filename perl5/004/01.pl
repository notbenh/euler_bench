#!/usr/local/bin/perl

use strict; use warnings;

# Problem 4
# 16 November 2001
#
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.


my $max = 0;
for my $a ( 100..999 ){
    for my $b ( $a..999 ){
        my $product = $a * $b;

        $max = $product if $product > $max
                       and $product eq reverse $product;
    }
}

print "$max\n";
