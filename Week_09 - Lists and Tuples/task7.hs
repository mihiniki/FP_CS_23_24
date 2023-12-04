import Data.Char

-- Define a function that accepts a list of whole numbers
-- and returns a list of lists, such that each list contains a sequence of consecutive numbers.

main :: IO()
main = do
    print $ pack [1, 2, 3, 7, 8 ,9] -- == [[1,2,3],[7,8,9]]
    print $ pack [1, 7, 8 ,9] -- == [[1],[7,8,9]]
    print $ pack [1, 9] -- == [[1],[9]]
    print $ f [42, 2, 3]

pack :: [Int] -> [[Int]]
pack [] = [[]]
pack (x:xs) = map reverse $ helper [x] xs
 where
    helper :: [Int] -> [Int] -> [[Int]]
    helper res [] = [res]
    helper res@(r:rs) (l:ls)
     | l == r + 1 = helper (l:res) ls
     | otherwise = res : helper [l] ls

type String = [Char]

f :: [Int] -> String
f [] = "Empty list"
f (42:_) = "Hello"
f _ = "Bye"

-- pack _ = 42

-- print $ f 42
-- f = map ((5 +) . digitToInt) . show
