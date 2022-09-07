sumdown:: Int -> Int

sumdown 0 = 0

sumdown n = sumdown(n-1) + n


merge :: Ord a=> [a] -> [a]->[a]

merge [] [] = []
merge x [] = x
merge [] x = x

merge (x:xs) (y:ys) | y <= x = y :merge (x:xs) ys
                    | otherwise = x: merge(y:ys) xs  

halve :: [a] -> ([a],[a])



halve x = (y,z) where
    y = take ((length x) `div` 2) x
    z =  drop ((length x) `div` 2) x


msort :: Ord a => [a] -> [a]



msort x = merge y z where
    y = fst(halve x)
    z = snd(halve x)  