main :: IO()
main = do
    print $ insert numberTreeBefore 13 == (Node 10 (Node 5 (Node 3 Nil Nil) (Node 7 Nil Nil)) (Node 15 (Node 13 Nil Nil) (Node 18 Nil Nil)))

    print $ (numberTreeAfter == numberTreeBefore) == True

    print $ secondNumberTree == Node 10 (Node 5 (Node 3 (Node 1 Nil Nil) Nil) (Node 7 (Node 6 Nil Nil) Nil)) (Node 15 (Node 13 Nil Nil) (Node 18 Nil Nil))

numberTreeBefore = Node 10 (Node 5 (Node 3 Nil Nil) (Node 7 Nil Nil)) (Node 15 Nil (Node 18 Nil Nil))

data BTree = Nil | Node Int (BTree) (BTree)
 deriving (Show, Eq)

insert :: BTree -> Int -> BTree
insert Nil v = Node v Nil Nil 
insert (Node value left right) v
 | v > value = Node value left (insert right v)
 | otherwise = Node value (insert left v) right 

numberTreeAfter = foldl insert Nil [10, 5, 15, 3, 7, 18]
secondNumberTree = foldl insert Nil [10, 5, 15, 3, 7, 13, 18, 1, 6]

