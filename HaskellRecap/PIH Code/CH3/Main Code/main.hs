-- Type is a collection of related values
-- Every expression must have a type, which is calculated prior
-- to evaluating the expression using Type Inference
-- Haskell programs are type safe

--Curried Function

add' :: Int->(Int->Int) --Example of type inference

--applies add(x) then (add(x)y)

add' x y = x+y

-- mult x y z means ((mult x) y) z

--Parametric polymorphism, same expression is applied regardless of type (Inclusion of type variable)
mylength :: [a] -> Int 

mylength [] = 0

mylength(x:xs) = 1 + mylength xs



--Overloaded Types

--Occurs with type classes  (Overloaded function with type class num (+)) can be overloaded as it works with the num type class

-- (+):: Num a => a -> a -> a

-- Type constraints — (Num a) => is a type constraint, which restricts the type a to instances of the class


--Inclusion of any type of number can be made precise with a class constraint

-- Parameters are overloaded, so 3 is a type of a which could be an integer or double or float

-- Example

-- 3:: Num a -> a (Instance of the class Num of numeric types)

-- Means for any numeric type a, 3 has a type a

-- Could be any of the numeric types (a) thanks to the class constraint Num

-- overloading means that for one symbol there
-- are different implementations 
-- (+) works with the Num class constraint (there are different implementations for this).
