// 2520 is the smallest number that can be divided by each of the
// numbers from 1 to 10 without any remainder.  What is the smallest
// number that is evenly divisible by all of the numbers from 1 to 20?

def isEvenlyDivisible(dividend: Int, divisors: Seq[Int]): Boolean = {
    divisors.forall(dividend % _ == 0)
}

val searchRange = 1 to Integer.MAX_VALUE
// no need to check 1, since everything is always divisible by 1
val divisors = 20 to 2 by -1
// build a tuple of n and if all divisors are even
println((searchRange.map((n) => (n, isEvenlyDivisible(n, divisors))) find(_._2 == true) get)._1)
