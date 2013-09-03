use v6;

=begin pod

The prime factors of 13195 are 5, 7, 13 and 29.

What is the largest prime factor of the number 600851475143 ?

=end pod

class PrimeIter {
    has $!cur = 2;
    method next {
        ($!cur++ and return 1) if $!cur == 1;
        ($!cur++ and return 2) if $!cur == 2;
        ($!cur++ and return 3) if $!cur == 3;
        $!cur++;
        $!cur++ while ! self.cur_is_prime;
        return $!cur;
    }
    method reset {
        $!cur = 2;
    }
    method cur_is_prime {
        # uncomment & rename method for easy conversion to normal sub :)
        #my $n = @_.shift;
        my $n = $!cur;

        return 0 if $n % 2 == 0;
        return 1 if $n < 4;

        my $x = 3;
        while ( $x <= sqrt $n ) {
            return 0 unless $n % $x;
            $x += 2;
        }
        return 1;
    }
}

my $to_factor = 600851475143;
my $pi = PrimeIter.new;

my @prime_factors;
my $n = $to_factor;

while $n > 1 {
    my $try_prime = $pi.next;
    #say "tp = $try_prime";
    if $n % $try_prime == 0 {
        @prime_factors.unshift($try_prime);
        $n /= $try_prime;
        #say "removed $try_prime, n=$n";
        $pi.reset;
    }
}

say @prime_factors[0];

#say "{@prime_factors}";     # array interp broken in rakudo 2009-07-25



