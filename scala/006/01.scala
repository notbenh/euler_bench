
def sumOfSquares(xs: Seq[Int]): Long = {
  (0L /: xs)((sum, x) => sum + Math.round(Math.pow(x, 2)))
}

def squareOfSum(xs: Seq[Int]): Long = {
  var sum = (0L /: xs)((sum, x) => sum + x)
  Math.round(Math.pow(sum, 2))
}

val range = 1 to 100
println(squareOfSum(range) - sumOfSquares(range))

