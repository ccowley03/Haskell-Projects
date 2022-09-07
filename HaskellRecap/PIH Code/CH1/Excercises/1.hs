myproduct:: Num a => [a] -> a

myproduct x = foldr (*) 1 x

myproduct2:: Num a=> [a] -> a

myproduct2 [] = 1

myproduct2 (x:xs) = x * myproduct2 xs




rqsort[] = []

rqsort(x:xs) = (rqsort larger) ++ [x] ++ (rqsort smaller)
              where
                smaller = [a|a<-xs, a <= x]
                larger = [b|b<-xs, b > x]

