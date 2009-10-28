
def sumOfSquares(xs: Seq[Int]): Long = {
  // can't use foldLeft b/c it's return type must match the type of 
  // elements in the list (why?????)
  var sum = 0L
  xs.foreach((x) => sum += Math.round(Math.pow(x, 2)))
  sum
}

def squareOfSum(xs: Seq[Int]): Long = {
  var sum = 0L
  xs.foreach((x) => sum += x)
  Math.round(Math.pow(sum, 2))
}

val range = 1 to 100
println(squareOfSum(range) - sumOfSquares(range))
