{-
Define the Vector type that is a tuple of three numbers and define the following functions:
    sumVectors - returns the sum of two vectors;
    scaleVector - returns a vector scaled by a number;
    dotProduct - scalar product;
-}

main :: IO()
main = do
    print $ sumVectors (1, 2, 3) (4, 5, 6) == (5, 7, 9)
    print $ sumVectors (0, 0, 0) (100, 200, -300) == (100, 200, -300)

    print $ scaleVector (1, 2, 3) 5 == (5, 10, 15)
    print $ scaleVector (5, 2, 159) (-2) == (-10, -4, -318)

    print $ dotProduct (1, 2, 3) (7, 4, 1) == 18
    print $ dotProduct (5, 2, 159) (0, -1, -2) == -320

--type Vector a = (a, a, a)
type Vector = (Int, Int, Int)

sumVectors :: Vector -> Vector -> Vector 
sumVectors (x1, y1, z1) (x2, y2, z2) = (x1 + x2, y1 + y2, z1 + z2)

scaleVector :: Vector -> Int -> Vector
scaleVector (x1, y1, z1) n = (x1*n, y1*n, z1*n)

dotProduct :: Vector -> Vector -> Int
dotProduct (x1, y1, z1) (x2, y2, z2) = x1*x2 + y1*y2 + z1*z2



