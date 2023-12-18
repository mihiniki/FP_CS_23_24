main :: IO()
main = do
    print $ maxSumSubT t1 == 5
    print $ maxSumSubT t2 == 2

t1 = Node 3 (Node 0 NullT NullT) (Node 2 (Node 0 NullT NullT) NullT)
t2 = Node (-3) (Node 0 NullT NullT) (Node 2 (Node 0 NullT NullT) NullT)

data BTree a = NullT | Node a (BTree a) (BTree a)

sumTree :: (Num a) => BTree a -> a
sumTree NullT = 0
sumTree (Node value left right) = value + (sumTree left) + (sumTree right)

allSums :: (Num a) => BTree a -> [a]
allSums NullT = []
allSums t@(Node value left right) = [sumTree t] ++ allSums left ++ allSums right

maxSumSubT :: (Num a, Ord a) => BTree a -> a
maxSumSubT = maximum . allSums 



