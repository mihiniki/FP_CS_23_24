main :: IO()
main = do
    print $ containsWord t1 "acd" == True
    print $ containsWord t1 "cd" == True
    print $ containsWord t1 "af" == False
    print $ containsWord t1 "ac" == False
    print $ containsWord t1 "acdh" == False
    print $ containsWord t1 "b" == False
    print $ containsWord t1 "e" == True
    print $ containsWord t2 "ab" == True
    print $ containsWord t2 "ad" == False
    print $ containsWord t3 "bdh" == True
    print $ containsWord t3 "bdi" == True
    print $ containsWord t3 "ac" == False


-- t1:      a
--         / \
--        c   b
--       / \   \
--      f   d   e

t1 = Node 'a' (Node 'c' (Node 'f' Nil Nil) (Node 'd' Nil Nil)) (Node 'b' Nil (Node 'e' Nil Nil))
t2 = Node 'a' (Node 'c' (Node 'd' Nil Nil) Nil) (Node 'b' Nil Nil)
t3 = Node 'a' (Node 'b' (Node 'd' (Node 'h' Nil Nil) (Node 'i' Nil Nil)) (Node 'e' Nil Nil)) (Node 'c' (Node 'f' Nil Nil) (Node 'g' Nil Nil))

data BTree = Nil | Node Char BTree BTree

containsWord :: BTree -> String -> Bool
containsWord Nil [] = True
containsWord Nil _ = False
containsWord t@(Node value left right) word@(x:xs)
 | x == value = helper t word
 | otherwise = containsWord left word || containsWord right word
 where
    helper :: BTree -> String -> Bool
    helper (Node value Nil Nil) [x] = x == value
    helper (Node value left right) (x:word) = x == value && ((helper left word) || (helper right word))
    helper _ _ = False