#!/usr/bin/env perl5.10
# Hello. I compare units of code for a given language and problem number
use 5.010;
use strict;
use warnings;
use Data::Dumper;
use Benchmark qw/:all/;
use File::Spec::Functions;

# Uses the $PARROT env variable or defaults to where I put it :)
my $parrot = $ENV{PARROT} || catfile( $ENV{HOME},qw{git parrot parrot});

my ($profile_lang,$euler_problem,$count) = @ARGV;
$profile_lang ||= 'parrot';
$euler_problem ||= '001';
$count ||= 1000;


my $code_dir = catdir($profile_lang,$euler_problem);
die "Euler Project Problem #$euler_problem for $profile_lang does not exist!" unless -e $code_dir;
my @codez = glob catdir($code_dir,'*');

my %bench_data =
    map {
        my $file = $_;
        $file => sub { system("$parrot $file &>/dev/null") }
    } @codez;

#die Dumper [ %bench_data ];
say "Benchmarking $profile_lang on EP#$euler_problem with $count iterations";
cmpthese($count, \%bench_data);

