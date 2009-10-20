/**

If we list all the natural numbers below 10 that are multiples of 3 or 5, we get
3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

*/

def eligible(x: Int): Boolean = {
    if(x % 3 == 0) true
    if(x % 5 == 0) true
    false
}

var sum = 0

for (i <- 0 until 1000 if eligible(i)) {
    sum += i
}

println(sum)


