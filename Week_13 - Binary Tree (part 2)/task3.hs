import Data.List
main :: IO()
main = do
    print $ genWords t1 -- == sort ["acf","acd","abe","cf","cd","f","d","be","e"]
    print $ genWords t2 -- == sort ["acd","ab","cd","d","b"]
    print $ genWords t3 -- == sort ["abdh","abdi","abe","acf","acg","bdh","bdi","be","dh","di","h","i","e","cf","cg","f","g"]

data BTree = Nil | Node Char BTree BTree

t1 :: BTree
t1 = Node 'a' (Node 'c' (Node 'f' Nil Nil) (Node 'd' Nil Nil)) (Node 'b' Nil (Node 'e' Nil Nil))

t2 :: BTree
t2 = Node 'a' (Node 'c' (Node 'd' Nil Nil) Nil) (Node 'b' Nil Nil)

t3 :: BTree
t3 = Node 'a' (Node 'b' (Node 'd' (Node 'h' Nil Nil) (Node 'i' Nil Nil)) (Node 'e' Nil Nil)) (Node 'c' (Node 'f' Nil Nil) (Node 'g' Nil Nil)) 

traverseDFS :: BTree -> [Char]
traverseDFS Nil = []
traverseDFS (Node value left right) = traverseDFS left ++ [value] ++ traverseDFS right

genWords :: BTree -> [String]
genWords t = filter (containsWord t) $ nub $ concat $ map subsequences $ permutations $ traverseDFS t

containsWord :: BTree -> String -> Bool
containsWord _ [] = False
containsWord Nil _ = False
containsWord t@(Node value left right) word@(x:xs)
 | x == value = helper t word
 | otherwise = containsWord left word || containsWord right word
 where
    helper :: BTree -> String -> Bool
    helper (Node value Nil Nil) [x] = x == value
    helper (Node value left right) (x:word) = x == value && ((helper left word) || (helper right word))
    helper _ _ = False