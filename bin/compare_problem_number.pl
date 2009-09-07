#!/usr/bin/env perl
# Hello. I compare units of code across languages for a given problem number
#use 5.010;
use strict;
use warnings;
use Data::Dumper;
use Benchmark qw/:all/;
use File::Spec::Functions;

my %interp = (
    parrot => $ENV{PARROT} || catfile( $ENV{HOME},qw{git parrot parrot}),
    perl5  => $ENV{PERL5} || 'perl5.10',
    # we should change perl6 to rakudo
    perl6  => $ENV{RAKUDO} || $ENV{PERL6} || catfile( $ENV{HOME},qw{git rakudo perl6}),
    ruby   => $ENV{RUBY} || 'ruby',
    erlang => $ENV{ERLANG} || 'escript',
    haskell => $ENV{GHC} || 'runghc',
);
my @languages = keys %interp;

my ($euler_problem,$count) = @ARGV;
$euler_problem ||= '001';
$count ||= 100;

my @codez;
for my $language (@languages) {
     push @codez, grep { $_ !~ /~$/ } glob(catdir($language,$euler_problem,'*'));
}
#warn Dumper [ @codez ];

my %bench_data = map {
    my $file = $_;
    my $lang;
    if ($file =~ m/^([a-z0-9]+)/i ) {
        $lang = $1;
    }
    die "Unknown language $lang" unless $interp{$lang};

    $file => sub { system("$interp{$lang} $file &>/dev/null") },
} @codez;

#warn Dumper [ %bench_data ];
print "Benchmarking EP#$euler_problem with $count iterations\n";
cmpthese($count, \%bench_data);

