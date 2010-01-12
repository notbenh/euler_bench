use strict;
use warnings;
use lib './lib';
use Math::Pell;
use List::AllUtils qw/all/;
use Data::Dumper;

# Project Euler - problem 66
#http://projecteuler.net/index.php?section=problems&id=66

my @squares; # list of squares up to 1000

for(2..1+int(sqrt(1000))) {
    push @squares, $_**2;
};

sub squarefree { all { $_[0] % $_ != 0 } @squares; }

my $maxD;
my $maxX=-1;
for (2..1000) { 
    my $D = $_;
    next unless squarefree($D);
    my @sol = Math::Pell->new({D=>$D})->find_minimal_sol;

    ($maxX  ,$maxD  ) = ($sol[0],$D     )
    if $maxX < $sol[0]
};

print $maxD;
