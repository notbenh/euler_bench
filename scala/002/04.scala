// http://en.literateprograms.org/Fibonacci_numbers_%28Scala%29

  def fib( n:Long) = fib_tr( n, 1, 0) 

  def fib_tr( n: Long, b: Long, a: Long): Long = n match {

    case 0 => a 
    case _ => fib_tr( n -1, a + b, b)
  }

  println(fib(40))
