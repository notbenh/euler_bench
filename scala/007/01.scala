import scala.Math._

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

val nthOne = 10001
val range = 1 to Integer.MAX_VALUE
println(range.filter(isPrime(_))(nthOne))
