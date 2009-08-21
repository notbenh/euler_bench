main = putStrLn . show $ square_of_sum - sum_of_squares
    where
      square_of_sum = sum [1..100] ** 2
      sum_of_squares = sum $ map (** 2) [1..100]
