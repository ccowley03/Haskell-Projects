double :: (Num a)=> a-> a

double a = a + a

adder :: Int -> Int

adder x = foldr (+) 0 [ x| x <-[1..x]]


mysum:: Num a => [a] -> a

mysum [] = 0

mysum (x:xs) = x + mysum xs


qsort:: Ord a => [a] -> [a]



qsort[] = []

qsort(x:xs) = (qsort smaller) ++ [x] ++ (qsort larger)
              where
                smaller = [a|a<-xs, a <= x]
                larger = [b|b<-xs, b > x]



