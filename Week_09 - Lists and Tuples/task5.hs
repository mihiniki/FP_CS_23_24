import Data.List
main :: IO()
main = do
    print $ isImage [] [] == True
    print $ isImage [1, 2, 3] [2, 3, 4] == True
    print $ isImage [1, 2, 3] [4, 6, 9] == False
    print $ isImage [1, 2, 3] [2, 5, 4] == False

    print $ isImage [2, 4, 7] [6, 8, 11] == True

isImage :: [Int] -> [Int] -> Bool
isImage [] [] = True
isImage xs ys = 1 == (length $ nub $ zipWith (-) xs ys )



