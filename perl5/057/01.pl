# Project Euler , problem 57 http://projecteuler.net/index.php?section=problems&id=57

use lib './lib';
use Math::Pell;

my $result;
Math::Pell->new({D=>2})->iterate_convergents(
    1001,
    sub {
#        print join(',',@_)."\n";
        $result += length($_[0]) > length($_[1]);
        0;
    }
);

print "$result\n";
