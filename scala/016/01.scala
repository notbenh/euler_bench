/*
def fact(x: BigInt): BigInt = {
  if(x == BigInt(0)) {
    BigInt(0)
  }
  else if(x == BigInt(1)) {
    BigInt(1)
  }
  else {
    x * fact(x - 1)
  }
}
*/

// split has "" as the first element, so we drop it
println(BigInt(2).pow(1000).toString.split("").drop(1).foldLeft(0L)(_ + Integer.parseInt(_)))
