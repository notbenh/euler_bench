
println(1 until 1000 filter((x) => x % 3 == 0 || x % 5 == 0) reduceLeft(_ + _))
