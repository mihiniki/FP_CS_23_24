import Data.List
import Data.Char
main :: IO()
main = do
    print $ countOccurrences "Test" 
    print $ countOccurrences "ThisIsAReallyLongWordContaingAlmostEveryCharacter"

countOccurrences :: String -> [(Char, Int)]
countOccurrences xs = map (\ ys -> (head ys, length ys)) $ group $ sort $ map (toLower) xs

