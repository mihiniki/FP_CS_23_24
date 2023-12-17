main :: IO()
main = do
    print $ t
    print $ size t == 13
    print $ getLevel t 3 == [1, 2]

data Tree a = Nil | Node a [Tree a]
 deriving (Show)

t = Node 10 [Node 3 [Node 5 [Nil], Node 8 [Node 1 [Nil], Node 2 [Nil]], Node 9 [Nil]], Node 7 [Node 11 [Nil], Node 13 [Nil]], Node 12 [Node 6 [Nil], Node 4 [Nil]]]

size :: Tree Int-> Int
size Nil = 0
size (Node value children) = 1 + (sum $ map (size) children)

getLevel :: Tree Int -> Int -> [Int]
getLevel Nil _ = []
getLevel (Node value _) 0 = [value]
getLevel (Node value children) k = concatMap (\ child -> getLevel child (k-1) ) children