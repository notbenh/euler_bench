-- Problem 4
-- 16 November 2001
--
-- A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 99.
--
-- Find the largest palindrome made from the product of two 3-digit numbers.

import Control.Monad

main = putStrLn . show . maximum $ palindromes

palindromes :: [Integer]
palindromes =
    do
      a <- [100..999]
      b <- [a..999]
      let prod = a * b
      guard $ isPalindrome prod
      return prod

isPalindrome n = (s == reverse s)
    where s = show n
