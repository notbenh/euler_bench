#!/usr/bin/env perl5.10
# Hello. I compare units of code across languages for a given problem number
use 5.010;
use strict;
use warnings;
use Data::Dumper;
use Benchmark qw/:all/;
use File::Spec::Functions;

# we should change perl6 to rakudo
my @languages = qw/ parrot perl5 perl6 /;
# Uses the $PARROT env variable or defaults to where I put it :)
my $parrot = $ENV{PARROT} || catfile( $ENV{HOME},qw{git parrot parrot});

my ($euler_problem,$count) = @ARGV;
$euler_problem ||= '001';
$count ||= 100;

my @codez;
for my $language (@languages) {
     push @codez, grep { $_ } glob(catdir($language,$euler_problem,'*'));
}
#die Dumper [ @codez ];

my %bench_data = map {
    my $file = $_;
    $file => sub { system("$parrot $file &>/dev/null") },
} @codez;

#warn Dumper [ %bench_data ];
say "Benchmarking EP#$euler_problem with $count iterations";
cmpthese($count, \%bench_data);

