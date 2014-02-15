# Euler Benchmark Suite

The Euler Benchmark Suite aims at comparing language speeds for the Euler
Project Problems at http://projecteuler.net/.

This currently consists of Perl 5, Rakudo Perl 6 and Parrot solutions, but all languages are
welcome.

## Installation

In order for the included comparison scripts to work, you need to
ensure that you have the necessary dependencies installed.

cd into the git checkout

    cd euler_bench
    perl Makefile.PL # answer yes to installing deps if you want comparison scripts to work
    make installdeps

Or if you have cpanminus (you should), then just type:

    cpanm --installdeps .


## File Naming

Files in each directory are named according to:

    <language>/<3-digit project euler number>/<2-digit implementation number>.ext

