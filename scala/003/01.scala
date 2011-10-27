import scala.Math._

// http://mathworld.wolfram.com/DirectSearchFactorization.html
//
// What is the largest prime factor of the number 600851475143 ?

// produces a list of divisors of x, in decreasing order, excluding x
def divisors(x: Long): Seq[Int] = {
    // start at sqrt of x, since that's the largest possible divisor
    val r = round(floor(sqrt(x))).toInt to 1 by -1
    // identify divisors
    r.filter(x % _ == 0)
}

// a number is prime iff it's only divisors are itself and 1
def isPrime(x: Long): Boolean = {
    divisors(x).length == 1
}

// pull the first divisor that's prime (also the largest, since
// divisors returns in decreasing order
val biggun = 600851475143L
println(divisors(biggun).filter(isPrime(_)).first)
