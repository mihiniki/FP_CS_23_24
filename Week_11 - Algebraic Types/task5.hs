{-
Define a polymorphic algebraic data type called `Point`.
A point may have two or three dimensions.

- Create an instance of every type and print it;
- Define a higher order function that accepts two functions:
    `f` and `g`, and a list of two-dimensional points.
    
The function should return those points
for which `f (firstCoord) = g (secondCoord)`.
-}

main :: IO()
main = do
    print $ getPoints (\x -> x * x) (2+) [TwoD 2 2, TwoD 1 2, TwoD 3 7] == [TwoD 2 2, TwoD 3 7]

data Point a = TwoD a a | ThreeD a a a
 deriving (Show, Eq, Ord, Read)

getPoints :: (Num a, Eq a) => (a -> a) -> (a -> a) -> [(Point a)] -> [(Point a)]
getPoints f g = filter (\ (TwoD x y) -> f x == g y) 


