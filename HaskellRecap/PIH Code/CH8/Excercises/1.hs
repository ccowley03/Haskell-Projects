--Recursive
data BinaryTree a = 
    Empty
    |Node (BinaryTree a) a (BinaryTree a) --Node and two sub trees left and right
    |Leaf a -- The value in the leaf
    deriving (Show)

-- e.g. Node (Node (Leaf 4) 3 Empty) 1 (Leaf 2)
 {-
     1
    / \
   4   2
  /
  3 
 
 
-}      