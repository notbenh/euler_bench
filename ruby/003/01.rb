#!/usr/bin/env ruby

# Find the largest prime factor of 600851475143

n = 600851475143

def factors(n)
    factors = [ ]
    bound   = Math.sqrt(n).floor
    (2..bound).each do |x|
        if n % x == 0
            factors.push(x, n/x)
        end
    end
    return factors
end

def prime_factors(n)
    prime_factors = [ ]
    f = factors(n).sort

    f.map { |x|
        if factors(x) == [ ]
            prime_factors.push(x)
        end
    }
    prime_factors.last
end
puts prime_factors(n)
