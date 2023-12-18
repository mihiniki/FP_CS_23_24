import Data.Char
import Data.List
main :: IO()
main = do
    print $ solve ["abode","ABc","xyzD"]                      == [4,3,1]
    print $ solve ["abide","ABc","xyz"]                       == [4,3,0]
    print $ solve ["IAMDEFANDJKL","thedefgh","xyzDEFghijabc"] == [6,5,7]
    print $ solve ["encode","abc","xyzD","ABmD"]              == [1, 3, 1, 3]

solve :: [String] -> [Int]
solve = map (\ xs -> length $ intersect (zip xs [1..]) (zip ['a'..'z'] [1..])) . map (map toLower) 
