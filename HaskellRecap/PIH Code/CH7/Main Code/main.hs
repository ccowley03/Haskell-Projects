import Data.Char
-- Higher order function takes a function as parameter and returns a function as a result

-- Currying -take in functions as parameters and return them as results
mymap :: (a->b) -> [a] ->[b]

mymap f xs = [f x|x<-xs]


myfilter :: (a->Bool) ->[a]->[b]

myfilter f [] = []

filter p xs = [x|x<-xs,p x]

-- Higher order function foldr (abbreviating fold right) encapsulates this pattern of recursion for defining functions on lists

-- foldr maps the empty list to the value v, and any non empty list to the function f applied to the head and recursively processed tail

-- foldr(\elem acc-> term) <start accum> <list>


-- Composition Operator

-- Returns two functions as one

-- (.) :: (b->c) ->(a->b )-> (a->c)

--f(g(x)) = f.g


--Coding Examples

type Bit = Int

bin2int :: [Bit]->Int


bin2int bits = sum [w*b| (w,b)<- zip weights bits]
            where weights = iterate (*2) 1


mybin2int :: [Bit] -> Int
mybin2int  = (foldr (\x y -> x + 2*y) 0)

myint2bin :: Int -> [Bit]

myint2bin 0 = []

myint2bin n = n `mod` 2 : myint2bin (n `div` 2)

make8 :: [Bit] -> [Bit]

make8 bits = take 8 (bits ++ repeat 0)

-- the library function repeat produces an infinite list of compromise
-- of a value but lazy evaluation ensures only as many elements are required

encode :: String -> [Bit]

encode = concat . map(make8 . int2bin . ord)


chop8 :: [Bit] -> [[Bit]]

chop8 [] = []

chop8 bits = take 8 bits : chop8(drop 8 bits)

decode :: [Bit] -> String

decode = map (chr . bin2int) . chop8


