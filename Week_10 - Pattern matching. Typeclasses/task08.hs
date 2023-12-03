{-
Define a function that takes two lists
and returns a list of tuples containing their elements.
-}

main :: IO()
main = do
    print $ toTuples [1, 2, 3, 4] [4, 3, 2, 1] == [(1, 4), (2, 3), (3, 2), (4, 1)]
    print $ toTuples [1.52, 2.75] [] == [(1.52, 0), (2.75, 0)]


