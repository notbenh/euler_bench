import Data.List

main = putStrLn . show . sum $ multiples
    where multiples = union [3,6..999] [5,10..995]
