// a tail recursive fib implementation
// http://en.literateprograms.org/Fibonacci_numbers_%28Scala%29
def fib(n: Int): Long = fib_tr(n, 1, 0) 

def fib_tr(n: Int, b: Long, a: Long): Long = n match {
    case 0 => a 
    case _ => fib_tr(n - 1, a + b, b)
}

// experimentations in summations (and tail recursion)
def acc_tr(n: Int): Int = {
  acc_tr_helper(n, 0)
}

def acc_tr_helper(n: Int, sum: Int): Int = n match {
  case 0 => sum
  case _ => acc_tr_helper(n - 1, n + sum)
}

val maxAllowedValue = 4000000
// perhaps a Projection to infinity instead?
val fibLessThanMax = (1 to Integer.MAX_VALUE).map(fib(_)).takeWhile(_ < maxAllowedValue)
println(fibLessThanMax.filter(_ % 2 == 0).foldLeft(0L)(_ + _))

// http://oldfashionedsoftware.com/2009/07/30/lots-and-lots-of-foldleft-examples/
