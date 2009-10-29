import scala.Math._

// produces a list of divisors of x, in decreasing order, excluding x
def divisors(x: Int): Seq[Int] = {
  // start at sqrt of x, since that's the largest possible divisor
  val r = round(floor(sqrt(x))).toInt to 1 by -1
  // identify divisors 
  r.filter(x % _ == 0)
}

// a number is prime iff it's only divisors are itself and 1
def isPrime(x: Int): Boolean = {
  // we know anything divisible by 2 isn't prime... except 2 itself
  if(x == 2) true
  if(x % 2 == 0 || x % 3 == 0) false

  // sieve
  divisors(x).length == 1
}

val maxVal = 2000000
val primes = Stream.from(2).filter(isPrime(_)).takeWhile(_ < maxVal)
println(primes.foldLeft(0L)(_ + _))
