#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw{sum reduce};
use Data::Dumper;
use Test::Most qw{no_plan};

sub D (@) {warn Dumper(@_)}
=pod
2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.

What is the smallest number that is evenly divisible by all of the numbers from 1 to 20?
=cut

sub LCM_range {
   my (@range) = @_;
   my $i = 0;
   my ($max,@R) = sort {$b<=>$a} @range;
   my $stop = reduce {$a * $b} @range;

   STEP: while ($i += $max) {
      die if $i > $stop; #it cant be any larger then this. 
      MULT: foreach (@R) {
         next STEP if ($i/$_) =~ m/[.]/; #nope this isn't evenly devisable
      }
      return $i;
   }
}

is( LCM_range(1..10), 2520 );
is( LCM_range(1..20), 232792560 );
