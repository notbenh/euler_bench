-- The prime factors of 13195 are 5, 7, 13 and 29.
--
-- What is the largest prime factor of the number 600851475143 ?

main = putStrLn . show . maxFactor $ 600851475143

maxFactor :: Integer -> Integer
maxFactor n =
    head . filter (\d -> n `mod` d == 0) . reverse . takeWhile (<= max) $ primes
    where
      max = floor . sqrt . fromInteger $ n


primes = 2:3:go 5 [] (tail primes)
    where
      divisibleBy d n = n `mod` d == 0
      go start ds (p:ps) = let pSq = p*p in
          foldr (\d -> filter (not . divisibleBy d)) [start, start + 2..pSq - 2] ds
          ++ go (pSq + 2) (p:ds) ps

