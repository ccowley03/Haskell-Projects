-- Conditional Expressions

-- Returns greater value
greater :: (Ord a) => a ->  a -> a

greater x y = if x > y then x 
    else y

-- Must always have an else branch


-- Guarded Equations

greater2 :: (Ord a )=> a -> a -> a

greater2 x y | x > y = x
             | otherwise =y

-- | is read as such that 


-- Pattern Matching

-- _ use a wilcard to signifiy every other possible outcome by matching the result of the other expressions (i.e spotting a pattern which can allow)
-- the compiler to evaluate this without needing more information (as a pattern is already established)

--Example
myand :: Bool -> Bool -> Bool 

myand True True = True -- We have enough information here to perform pattern matching

myand _ _ = False -- These can represent any other combinations of values


-- Lambda Expressions

-- Anonymous functions!

-- compromise a pattern for each arguments and a function body but no name

--Example

add2 :: Int -> Int -> Int

add2 = (\x -> (\y-> x+y)) -- unknown function with parameter x uses another unkown function with parameter y, both paired together to provide the final function body

-- order of evaluation from left to right
-- Same as curried!

-- Good to be used when you are referencing a function you will only ever use once in a program, (maybe inside one important function!)



