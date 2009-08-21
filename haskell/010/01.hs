--
-- overflows the stack after 30 min :-(
--

primes = 2:3:go 5 [] (tail primes)
    where
      divisibleBy d n = n `mod` d == 0
      go start ds (p:ps) = let pSq = p*p in
          foldr (\d -> filter (not . divisibleBy d)) [start, start + 2..pSq - 2] ds
          ++ go (pSq + 2) (p:ds) ps

main =
    putStrLn . show . sum $ take 2000000 primes
