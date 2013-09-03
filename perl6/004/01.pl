#!/Users/jeff/Code/rakudo/perl6


# Problem 4
# 16 November 2001
#
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.


my $max = 0;
for (100..999) -> $x {
    for ($x..999) -> $y {
        my $product = $x * $y;

        $max = $product if $product > $max
                       and $product eq $product.flip;
    }
}

say "$max";
