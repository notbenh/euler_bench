# Tweaked by Jonathan Leto to solve Euler Problem 7
# Copyright (C) 2001-2008, Parrot Foundation.
# $Id: primes2.pir 38923 2009-05-19 06:07:42Z cotto $

=head1 NAME

Calculate the 10001st prime number

=head1 SYNOPSIS

    % time parrot ./parrot/007/01.pir

=head1 DESCRIPTION

Use PMCs, not ints.

=cut

.sub main :main

  .local pmc i, max, i6, i7

  i   = new 'Integer'
  i   = 5
  max = new 'Integer'
  max = 10001
  i6  = new 'Integer'
  i6  = 2
  i7  = new 'Integer'
  i7  = 0

LOOP:
  $I0 = isprime(i)
  unless $I0 goto NOTPRIME
  assign i7, i
  inc i6
#  say i6
NOTPRIME:
#  say "not prime"
  inc i
  inc i
  if i6 == max goto DONE
  goto LOOP

DONE:
  print "10001st prime is: "
  say   i7
.end

# this should only check between 3 and sqrt(n) for
# factors
.sub isprime
  .param pmc input
  .local pmc n

  if input < 1 goto FALSE

  n = new 'Integer'
  n = input - 1

LOOP:
  if n <= 1 goto DONE

  $P0 = new 'Integer'
  $P0 = input % n
  unless $P0 goto FALSE
  dec n
  goto LOOP

DONE:
  .return(1)
FALSE:
  .return(0)
.end
