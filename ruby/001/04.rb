#/usr/bin/env ruby

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get
# 3, 5, 6 and 9. The sum of these multiples is 23.
#
# Find the sum of all the multiples of 3 or 5 below 1000.

sum = 0
n = 1

while n < 1000
  if n % 3 == 0 || n % 5 == 0
    sum += n
  end
  n += 1
end

puts sum
