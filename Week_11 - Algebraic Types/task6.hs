-- Define a function that finds the distance between two points.

main :: IO()
main = do
    print $ distance (TwoD 2 5) (TwoD 6 9) -- == 5.66
    print $ distance (ThreeD 2 5 10) (ThreeD 6 9 (-5)) -- == 16.03
    -- print $ distance (ThreeD 2 5 10) (TwoD 6 9) == 16.03

data Point a = TwoD a a | ThreeD a a a
 deriving (Show, Eq, Ord, Read)

roundTwoDigits :: (Fractional a, RealFrac a) => a -> a
roundTwoDigits =  (/ 100) . fromIntegral . round . (*100)

distance :: (Fractional a, RealFrac a, Floating a) => (Point a ) -> (Point a) -> a
distance (TwoD _ _) (ThreeD _ _ _) = error "Can't find distance!"
distance (ThreeD _ _ _) (TwoD _ _) = error "Can't find distance!"
distance (TwoD x y) (TwoD x1 y1) = roundTwoDigits $ sqrt $ ((x-x1)^2 + (y-y1)^2)
distance (ThreeD x y z) (ThreeD x1 y1 z1) =  roundTwoDigits $ sqrt $ ((x-x1)^2 + (y-y1)^2 + (z - z1)^2)


