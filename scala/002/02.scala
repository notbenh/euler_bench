
// http://scala-blogs.org/2007/12/project-euler-fun-in-scala.html
lazy val fib: Stream[Int] = Stream.cons(0, Stream.cons(1, fib.zip(fib.tail).map(p => p._1 + p._2)))
println(fib.filter(_ % 2 == 0).takeWhile(_ <= 4000000).foldLeft(0L)(_ + _))
