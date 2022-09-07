fac :: Int -> Int

fac 0 = 1  --Base Case

fac n = n * fac(n-1) --Recursive call

-- Recursion on lists

myproduct :: Num a => [a] -> a

myproduct [] = 1

myproduct(x:xs) = x * (product xs)

insert:: Ord a => a -> [a] -> [a]

insert x [] = [x]

insert x (y:ys) | x <= y = x:y:ys
                | otherwise = y : insert x ys


isort :: Ord a => [a] -> [a]

isort [] = []

isort(x:xs) = insert x (isort xs)

myzip :: [a] -> [b] -> [(a,b)]

myzip [] _ = []

myzip _ [] = []

myzip(x:xs) (y:ys) = (x,y) : myzip xs ys


-- Multiple Recursion

qsort :: Ord a => [a] -> [a]

qsort [] = []

qsort(x:xs) = qsort smaller ++ [x] ++ qsort larger 
              where
                  smaller = [a|a<-xs,a <= x]
                  larger = [b|b<-xs,b > x]




-- Mutual Recursion

-- If recursive call is an odd number of times we know we will stay in the odd function and therefore break out

myeven :: Int -> Bool

myeven 0 = True

myeven n = myodd (n-1)

myodd :: Int -> Bool

myodd 0 = False

myodd n  = myeven (n-1)



-- IT works
justeven :: [Int] -> [Int]

justeven [] = []

justeven(x:xs) | odd x == True = justeven xs
               | otherwise =  x: justeven xs


