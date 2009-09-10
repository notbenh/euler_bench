import Control.Monad

main = putStrLn . show $ triplet

triplet = head $ do
    a <- [1..1000]
    b <- [1..1000]
    let c = 1000 - a - b
    guard (a < b)
    guard (a*a + b*b == c*c)
    [(a,b,c)]

