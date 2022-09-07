--1)Type inference
-- Type is calculated prior to evaluation

--True :: Bool

--"" :: String


--2)Curried Functions
--Take in and return functions as a result, takes arguments one at a time,returns one function at a time (Partial function)


curriedexpr :: Num a=>a -> (a -> (a->a)) 

curriedexpr a b c = a + b * c

--takes in an integer a and returns a function which in return takes in a integer b returns a function take takes in an integer c and finally returns a+b*c

--((curriedexpr a) b) c



lambdaexpr = \a ->(\b ->(\c -> a + b * c))

-- just lambdaexpr 1 2 returns (\c -> 1 + 2 * c) which is a partial function needs the third parameter(now just a function with one parameter) (taken one at a time)




--real world example

--food scanner

type Change = Int

--scanner = \barcode ->(\cash ->(\verify-> Change))




--3) Polymorphic Types

--elements can have any type by using a type variable such as [a]

--example

--Polymorphic function as implementation works regardless of type

--Parametric polymorphism

rep ::  a ->[a]

rep n  = [] ++ replicate 4 n
--

len ::[a] -> Int

len [] = 0

len(x:xs) = 1 + len xs


-- 4) Overloaded Types 
-- Can be a more specific type, e.g an instance of a type class that behaves a certain way, called a class constraint
-- A type that is orderable is an instance of the type Ord and can be restricted to behave as a comprarative value

mysort :: Ord a => [a] ->[a]

mysort[] = []

mysort [x] = [x]

mysort (x:ys:z) = if x > ys then ys:mysort(x:z)
             else x:mysort(ys:z)


-- 5) Composition Operator

lowest :: Ord  a=> [a]-> a

lowest = head . mysort




--6) Conditional

highest :: Int -> Int->Int

highest x y = if x > y then x
          else y


--7) Guarded
newhighest :: Int->Int->Int

newhighest x y | x > y = x
               | otherwise = y


--8) Pattern Matching
--Give the compiler information and can intuitively work out results of other conditional

--On lists
mytail :: [a] -> [a]

mytail [x] = [x]

mytail(_:y) = mytail y



--9) Lambda expressions

--Anonymous functions (have no name), good to be used when only referenced once as it doesnt need a declaration

chartostring :: [Char] -> String

chartostring = foldr (\c -> (++) (replicate 1 c)) ""

--10) List comprehension code example

myeven :: Int -> [Int]

myeven n  = [x |x<-[1..n],even x == True]

divby3 :: Int -> [Int]

divby3 n = [x |x<-[1..n],x `mod` 3 == 0]


--10) Recursion, Just explain these


--mysort :: Ord a => [a] ->[a]

--mysort[] = []

--mysort [x] = [x]

--mysort (x:ys:z) = if x > ys then ys:mysort(x:z)
             --else x :mysort (ys:z)



-- 11) Partial Application (Idea of currying)

quadruplelist:: [Int] -> [Int]

quadruplelist = map (\x -> 4*x)

-- Returns a function with less paramters

-- returns (map (\x-> 4*x)) [] which is a function and evaluates to a list, now redefined as quadruplelist []

-- meaning function has been partially applied (map to the lambda expressions)


--12) High Order Functions
--seen how currying works, take in a function return it,
-- this is a high order function

boolfunctlist :: (a -> Bool) -> [a] ->[a]

boolfunctlist f ys = [x |x <- ys,f x]

--EXPLAIN HOW FOLDR WORKS USING YOUR Example

--maps empty list to accumulator value

--operator is applied to head of the list as a result of recursively processing the tail (tail first to head)

--right to left

--chartostring = foldr (\c -> (++) (replicate 1 c)) ""

-- example ['a',b',c'] gives

--'a': ('b' :('c':[])) (right to left)

-- replicate 1 'a' ++ (replicate 1 'b' ++ (replicate 1 'c' ++ ""))



-- 13) Types

--new type is an alias of an existing type using the type keyword

type Coord = (Int,Int)

-- increases code readability and can be used in functions




--14) Data declarations, completely new type with different types called contrustors

--groups data together makes functions more powerful as it can interact with diferent types easier

--need to produce functions to decompose the data

data BinaryTree a =
    Node (BinaryTree a) a (BinaryTree a) --Node and two sub trees left and right
    |Leaf a -- The value in the leaf
    deriving (Show)

--Binary tree, can use recursive functions to give definitions and functionalites to how the types should behave,
--e.g leaf a would be decomposed in a function to access its data



treelen :: (BinaryTree a) -> Int

treelen (Leaf a)  = 1


treelen(Node lc p rc) = treelen lc + 1 + treelen rc 



numofleaves :: (BinaryTree a) -> Int


numofleaves (Leaf a) = 1


numofleaves (Node lc p rc) =  numofleaves lc  + 0  + numofleaves rc 


-- e.g.  (Node(Node (Leaf 1) 4 (Leaf 5)) 
 {-
     4
    / \
   1   5



treelen (Node(Node (Leaf 1) 1 (Leaf 2)) 2 (Node (Leaf 1) 1 ( Leaf 4))) = 7
 
    2
   / \ 
  1   1
 / \ / \
1  2 1  4

-}






-- Lazy evaluation

--avoids unnecessary evaluation

--ensure termination when possible

--Supports programming with infinite lists

--redex (reducible expression)

-- inner redex

notinf ::Int -> [Int]

infinity = iterate (+1) 1


notinf x = take x ([] ++ infinity)