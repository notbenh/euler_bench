// http://projecteuler.net/index.php?section=problems&id=4

def isPalindrome(x: Int): Boolean = {
   val xStr = new scala.runtime.RichString(x.toString)
   xStr.reverse == xStr
}

def expandRange(x: Int): Seq[Int] = {
    val range = 999 to 1 by -1
    range.map(_ * x)
}

def expandRangeOnlyPals(x: Int): Seq[Int] = {
    val range = 999 to 1 by -1
    range.map(_ * x).filter(isPalindrome(_))
}

val range = 999 to 1 by -1
// val pals = range.flatMap(expandRange(_)).filter(isPalindrome(_))

val pals = range.flatMap(expandRangeOnlyPals(_))
// why don't things stay in order out of flatMap? we're going 999, 998 etc
// so this sort shouldn't be required
println(scala.util.Sorting.stableSort(pals).last)

