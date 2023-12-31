{-
Define a predicate that checks whether a square matrix is triangular.
A square matrix is triangular if all the elements below its main diagonal are 0.
> Implementation detail: Use pattern matching and type classes!
-}

main :: IO()
main = do
    print $ isTriangular [] == True
    print $ isTriangular [[-1]] == True
    print $ isTriangular [[-1, -2, -3], [0, -5, -6], [0, 0, -9]] == True
    print $ isTriangular [[1, 2, 3], [0, 5, 6], [0, 0, 9]] == True
    print $ isTriangular [[0, 2, 3], [0, 0, 6], [1, 0, 0]] == False
    print $ isTriangular [[1, 2, 3], [1, 5, 6], [0, 0, 9]] == False
    print $ isTriangular [[1, 2, 3, 4], [0, 5, 6, 7], [0, 0, 8, 9], [0, 0, 0, 9]] == True

isTriangular :: [[Int]] -> Bool
isTriangular [] = True
isTriangular (xs:xss) = helper 1 xss
 where
    helper :: Int -> [[Int]] -> Bool
    helper _ [] = True
    helper cnt (xs:xss) = (all (== 0) $ take cnt xs) && helper (cnt + 1) xss
    -- | otherwise = False
