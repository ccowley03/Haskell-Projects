--Declaring Types and Classes


--introduce a new name for an existing type

type String = [Char]

type Pos = (Int,Int)

type Trans = Pos -> Pos

-- Increases code readability

--Data Declarations

-- A completely new type, ass opposed to a synonym for an existing type, can be declared by specifying its values using the data mechanism of haskell

data MyBool = False | True

-- | symbol is read as or, and the new values of the type are called constructors

data Shape = Circle Float | Rect Float Float

-- Circle and Rec are actually constructor functions

-- Circle 1.0 is just a piece of data

-- Need functions to decompose the data i.e make Circle r = r (use the data)

-- To also define how the types behave

-- Has no expression

-- If a new type has a single constructoer with a single argument, then it can be declared as newtype

area :: Shape -> Float

Circle :: Float -> Shape

Rect :: Float->Float->Shape
area (Circle r) = pi * r^2

area (Rect x y ) = x* y

-- Recursive

data Nat = Zero | Succ Nat

Zero :: Nat

Succ :: Nat->Nat

nat2int :: Nat -> Int

nat2int 0 = Zero


nat2int (Succ n) = 1 + nat2int n

data Tree a = Leaf a | Node (Tree a) (Tree a)


data Maybe a = Nothing | Just a

safediv :: Int -> Int -> Maybe Int

safediv _ 0 = Nothing
safediv m n = Just(m `div `n)

-- Helps with things that can fail, as values are defined

add :: Nat -> Nat -> Nat

add Zero  n = n


add(Succ m) n = Succ(add m n)

data Expr = Val Int | Add Expr | Mul Expr Expr

size :: Expr -> Int

size (Val n) = 1

size(Add x y) = size x + size y

size (Mul x y) = size x + size y

-- Class and Instance Definitions

-- New class can be declared using the class mechanism

class Eq a where
    (==),(/=) :: a -> a -> Bool

    x /=y not (x==y)

--type a must support equality and inequality operators

data Bool = False | True
            deriving(Eq,Ord,Show, Read)
-- Bool is an instance of all of these Classes, so its showable, readable and can be evaluated


-- instance keyword describes the behaviour of a type when it is an instance of that class i.e Instance eq (instance of class Eq)