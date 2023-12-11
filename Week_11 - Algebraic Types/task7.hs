-- Define a function that accepts a point `p` and a list of points.
-- The function returns the points from the list that are closest to `p`.

main :: IO()
main = do
    print $ closestTo (ThreeD 2 5 10) [(ThreeD 4 5 6), (ThreeD 5 2 (-10)), (ThreeD (-2) 1 45), (ThreeD 12 0 2), (ThreeD 6 5 4)] -- == [ThreeD 4.0 5.0 6.0]

data Point a = TwoD a a | ThreeD a a a
 deriving (Show, Eq, Ord, Read)

distance :: (Fractional a, RealFrac a, Floating a) => (Point a ) -> (Point a) -> a
distance (TwoD _ _) (ThreeD _ _ _) = error "Can't find distance!"
distance (ThreeD _ _ _) (TwoD _ _) = error "Can't find distance!"
distance (TwoD x y) (TwoD x1 y1) = roundTwoDigits $ sqrt $ ((x-x1)^2 + (y-y1)^2)
distance (ThreeD x y z) (ThreeD x1 y1 z1) =  roundTwoDigits $ sqrt $ ((x-x1)^2 + (y-y1)^2 + (z - z1)^2)

roundTwoDigits :: (Fractional a, RealFrac a) => a -> a
roundTwoDigits =  (/ 100) . fromIntegral . round . (*100)

--closestTo :: (Fractional a, Floating a) => (Point a) -> [(Point a)] -> [(Point a)]
closestTo point points = filter (\ p -> distance p point == distance point minPoint) points
 where
    minPoint = foldl1 (\ p1 p2 -> if distance point p1 < distance point p2 then p1 else p2) points
    --minDist = minimum $ map (\ p -> distance p point) points
