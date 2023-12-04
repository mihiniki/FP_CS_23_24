{-
Using type classes, pattern matching and no built-in functions define a function that:
    - checks whether a list is empty;
    - returns the first element of a list;
    - removes the first element of a list;
    - removes the first n elements from a list;
    - concatenates two lists;
    - concatenates the elements of a list ("++" is allowed):
    - solve with pattern matching;
    - solve with folding.
-}

main :: IO()
main = do
    print $ isNull [] == True
    print $ isNull [1 .. 5] == False
    print $ isNull ['a', 'b'] == False
    print $ isNull [1.75 .. ] == False

    print $ firstEl [1] == 1
    print $ firstEl [10, 5, 6] == 10
    print $ firstEl ["I am", "You are"] == "I am"

    print $ removeFirst [5, 2, 3] == [2, 3]
    print $ removeFirst ["OOpps"] == []

    print $ fromXs 5 [1, 2, 3, 4, 5, 6] == [6]
    print $ fromXs 5 ["A", "B", "C"] == []

    print $ concatenate [1, 2, 3] [5, 8, 9] == [1, 2, 3, 5, 8, 9]
    print $ concatenate [1] [5, 8, 9] == [1, 5, 8, 9]
    print $ concatenate ['1', '2', '3'] ['5'] == "1235"

    print $ join [[1, 2], [5, 6], [9]] == [1, 2, 5, 6, 9]
    print $ join [['H'], ['a', 's'], "kell"] == "Haskell"

    

isNull :: [a] -> Bool
isNull [] = True
isNull xs = False
-- isNull _ = False

firstEl :: [a] -> a
firstEl [] = error "Empty list!"
firstEl (x:xs) = x
-- firstEl (x:_) = x

removeFirst :: [a] -> [a]
removeFirst [] = []
removeFirst (_:xs) = xs

fromXs :: Int -> [a] -> [a]
fromXs _ [] = []
fromXs 0 xs = xs
fromXs n (x:xs) = fromXs (n - 1) xs

concatenate :: [a] -> [a] -> [a]
concatenate [] ys = ys
concatenate xs [] = xs
concatenate (x:xs) ys = x : concatenate xs ys

join :: [[a]] -> [a]
join [] = []
join (xs:xss) = xs ++ join xss

joinFold :: [[a]] -> [a]
joinFold xss = foldl (\ xs acc -> xs ++ acc) [] xss
-- joinFold xss = foldl (++) [] xss
-- joinFold xss = foldl1 (++)




