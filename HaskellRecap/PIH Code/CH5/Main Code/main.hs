import Data.Char
myreverse :: [a] -> [a]

myreverse [] = []


myreverse(x:xs) = ys++[x]
      where
          ys = myreverse xs



myreverse2 :: [a] -> [a] 


myreverse2  = foldl (flip(:)) [] --flip the list and prepend to empty from left to right

let2int :: Char -> Int

let2int c = ord c - ord 'a'

int2let :: Int->Char

int2let n = chr(ord 'a' +n)


shift ::Int -> Char -> Char

shift n c | isLower c = int2let ((let2int c + n ) `mod` 26)
          | otherwise = c


encode :: Int -> String -> String

encode n xs = [shift n x| x<-xs]



decode :: Int -> String -> String

decode n xs = [shift (-n) x| x<-xs]

