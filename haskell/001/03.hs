import Data.List

main = putStrLn . show . sum $ multiples
    where multiples = merge (filter (\x -> x `mod` 3 == 0) [1..999]) (filter (\x -> x `mod` 5 == 0) [1..999])

merge :: Ord a => [a] -> [a] -> [a]
merge [] l = l
merge l [] = l
merge l1@(x:xs) l2@(y:ys) =
    case compare x y of
      LT -> x:(merge xs l2)
      GT -> y:(merge l1 ys)
      EQ -> x:(merge xs ys)
