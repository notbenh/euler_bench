// http://projecteuler.net/index.php?section=problems&id=4

def isPalindrome(x: Int): Boolean = {
   val xStr = new scala.runtime.RichString(x.toString)
   xStr.reverse == xStr
}

def expandRange(x: Int): Seq[Int] = {
    val range = 999 to 1 by -1
    range.map(_ * x)
}

val range = 999 to 1 by -1
println(range.flatMap(expandRange(_)).filter(isPalindrome(_)).first)
