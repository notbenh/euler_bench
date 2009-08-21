import Data.List

main = putStrLn . show . sum $ multiples
    where multiples = union (filter (\x -> x `mod` 3 == 0) [1..999]) (filter (\x -> x `mod` 5 == 0) [1..999])
