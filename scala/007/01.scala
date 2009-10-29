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
  divisors(x).length == 1
}

val nthOne = 10001
println(Stream.from(1).filter(isPrime(_))(nthOne))
