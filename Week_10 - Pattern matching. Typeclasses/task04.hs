{-
Write a function that takes a tuple in the form (a, b)
and returns the tuple (x, y)
where x is the quotient of the division
between a and b
and y is the remainder.
    - solve without pattern matching;
    - solve with pattern matching;
    - solve using a lambda.
-}

main :: IO()
main = do
    print $ divideNoPM (10, 5) == (2, 0) -- div 10 5 = 2 and 10 % 5 = 0
    print $ divideNoPM (69, 42) == (1, 27)

    print $ dividePM (10, 5) == (2, 0)
    print $ dividePM (69, 42) == (1, 27)

    print $ (\ (a, b) -> (div a b, mod a b)) (10, 5) == (2, 0)
    print $ (\ (a, b) -> (div a b, mod a b)) (69, 42) == (1, 27)

divideNoPM :: (Int, Int) -> (Int, Int)
divideNoPM tuple = (div (fst tuple) (snd tuple), mod (fst tuple) (snd tuple))

dividePM :: (Int, Int) -> (Int, Int)
dividePM (a, b) = (div a b, mod a b)




