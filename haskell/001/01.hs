main = putStrLn . show . sum $ multiples
    where multiples = filter (\x -> x `mod` 3 == 0 || x `mod` 5 == 0) [1..999]
