{-
Write a function that outputs the sum of a tuple with two elements.
    - solve without pattern matching;
    - solve with pattern matching;
    - solve using a lambda.
-}

main :: IO()
main = do
    print $ sumTupleNoPM (4, 5) == 9
    print $ sumTupleNoPM (-5, 5) == 0

    print $ sumTuplePM (4, 5) == 9
    print $ sumTuplePM (-5, 5) == 0

    print $ (\ (x, y) -> x + y) (4, 5) == 9
    print $ (\ (x, y) -> x + y) (-5, 5) == 0

sumTupleNoPM :: (Int, Int) -> Int
sumTupleNoPM tuple = fst tuple + snd tuple

sumTuplePM :: (Int, Int) -> Int
sumTuplePM (x, y) = x + y


