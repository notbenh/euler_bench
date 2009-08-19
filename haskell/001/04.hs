import Data.List

main = putStrLn . show . sum $ multiples
    where multiples = union (map (3*) [1..333]) (map (5*) [1..199])
