{-
Define two functions that accept a list of shapes and:
    1. The first returns their areas.
    2. The second returns the shape with the biggest area.
-}

main :: IO()
main = do
    print $ getAreas [Circle 5, Rectangle 2.5 4.5, Rectangle 5.5 20.6, Triangle 5.3 3.9 4.89, Cylinder 20 30] -- == [78.54, 11.25, 113.3, 9.13, 9424.77]
    print $ maxArea [Circle 5, Rectangle 2.5 4.5, Rectangle 5.5 20.6, Triangle 5.3 3.9 4.89, Cylinder 20 30] == Cylinder 20.0 30.0

data Shape a = Circle a | Rectangle a a | Triangle a a a | Cylinder a a
 deriving (Show, Eq, Ord, Read)

area :: (Floating a) => (Shape a) -> a
area (Circle r) = pi*r*r
area (Rectangle x y) = x*y
area (Triangle x y z) = sqrt $ halfPer*(halfPer - x)*(halfPer - y)*(halfPer-z)
 where 
    halfPer = (x + y + z) / 2
area (Cylinder h r) = 2 * pi * r * h + 2 * pi * r * r

roundTwoDigits :: (Fractional a, RealFrac a) => a -> a
roundTwoDigits =  (/ 100) . fromIntegral . round . (*100)

getAreas :: (Floating a, RealFrac a) => [(Shape a)] -> [a]
getAreas = map (roundTwoDigits . area)

maxArea :: (Floating a, RealFrac a) => [(Shape a)] -> (Shape a)
maxArea = foldr1 (\ s1 s2 -> if area s1 > area s2 then s1 else s2) 



