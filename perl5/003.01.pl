#!/usr/bin/perl 
use strict;
use warnings;
use Memoize;
use Test::Most qw{no_plan};
use POSIX qw{ceil};
use Data::Dumper;

=pod
The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?
=cut

memoize('prime');
sub prime {
   my ($num) = @_;
   # we go past the range limit if we do this
   #grep{ $num % $_ == 0 && scalar(prime($_)) == 0 } 2..ceil($num/2);

   my %primes;
   my $x = 2;
   my $max = ceil($num/2);
   while ( $x++ < $max ) {
      my $result = $num/$x;

warn Dumper({ $num => sprintf(q{%s * %s},$x,$result) }) if $x < 35;
      if ($result == int($result) ) {
         #it's a factor, for speed lets check for primeness of both sides.
         map{$primes{$_}=1} grep{scalar(prime($_))} $x, $result;
warn Dumper({ $x => \%primes }) if $x < 35;

      }
   }
   return sort {$a <=> $b} keys %primes;
}


eq_or_diff( [prime(13)], [] );
eq_or_diff( [prime(13195)], [5,7,13,29] );
#eq_or_diff( [prime(600851475143)], {} );

