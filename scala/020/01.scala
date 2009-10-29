
object BetterBigInt {
  def apply(n: Int) = new BetterBigInt(n)

  implicit def int2better(n: Int) = apply(n)

  def factorial(x: Int): BetterBigInt = new BetterBigInt((1 to x).foldLeft(1: BigInt)(_ * _))
}

class BetterBigInt(val n: java.math.BigInteger) extends BigInt(n) {
  def this(n: Int) = this(java.math.BigInteger.valueOf(n))
  def this(n: BigInt) = this(n.bigInteger)

  def ! = BetterBigInt.factorial(n.intValue)
}

val x: BetterBigInt = 100
// split has "" as the first element, so we drop it
println((x!).toString.split("").drop(1).foldLeft(0L)(_ + Integer.parseInt(_)))
