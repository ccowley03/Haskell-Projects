halve :: [a] -> ([a],[a])

halve xs  = (take n xs,drop n xs)
     where
         n = (length xs) `div` 2


third1 :: [a] -> a

third1 a = a!!2

third2 :: [a] -> a

third2 x =  head(drop 2 x)


