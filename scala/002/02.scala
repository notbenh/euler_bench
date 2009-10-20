object Fibonacci extends Application 
{
  def fibo(n: Int): Int =
    if (n < 2) 1
    else fibo(n - 1) + fibo(n - 2);

  val x = 4
  Console.println("fib("+ x +") = " + fibo(x));
};

