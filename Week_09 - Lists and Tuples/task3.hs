main :: IO()
main = do
    print $ getPalindromesLC 132465 == 8
    print $ getPalindromesLC 654546 == 8
    print $ getPalindromesLC 100001 == 100012
    print $ getPalindromesLC 21612 == 21614
    print $ getPalindromesLC 26362 == 26364

    print $ getPalindromesHOF 132465 == 8
    print $ getPalindromesHOF 654546 == 8
    print $ getPalindromesHOF 100001 == 100012
    print $ getPalindromesHOF 21612 == 21614
    print $ getPalindromesHOF 26362 == 26364


isPalindrome :: Int -> Bool
isPalindrome n = n == (read $ reverse $ show n)
-- isPalindrome n = (show n) == reverse $ show n

getPalindromesLC :: Int -> Int
getPalindromesLC n = minimum divides + maximum divides
 where 
    divides = [x | x <- [2 .. n], isPalindrome x && mod n x == 0]

getPalindromesHOF :: Int -> Int
getPalindromesHOF n = minimum divides + maximum divides
 where
    divides = filter (isPalindrome) $ filter (\ x -> mod n x == 0) [2 .. n]