main :: IO()
main = do
    print $ "Hello world"
    print $ f 6
    print $ f 42

f :: Int -> String
f n
 | n == 42 = "Bye" 
 | otherwise = "Hello"
