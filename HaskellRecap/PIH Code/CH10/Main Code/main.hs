import System.IO
-- IO

-- Most programs are just pure functions (with explicit arguments)

-- In haskell an interactive program is viewed as a pure function that takes the current state of the world as its argument

-- instantiate a Type IO which takes in a TYPE WORLD and returns it

--Expressions of type IO are called actions

--type IO a = World -> (a,World)

-- while IO () is a type of actions that return the empty tuple() as a dummy result value. 

-- Actions of the latter type can be though of as purely side affecting actions that return no result value

-- IO is a built in type whose implementations are hidden

-- getChar :: IO Char

-- return :: a -> IO a

-- Function return provides a bridge from pure expressions without side affects to impure actions

-- Sequencing

--Sequence of IO actions can be combined into a single composite action
-- use DO


act :: IO (Char,Char)  --Instance of IO, so you get its methods


act = do x <- getChar 
         getChar
         y <- getChar --Generator for the variables returned
         return (x,y)

myStrLen :: IO ()

myStrLen = do putStr "Enter a String: "
              xs <- getLine
              putStr "The string has "
              putStr (show(length xs))
              putStrLn " characters"

hangman :: IO ()

hangman = do putStrLn "Think of a word:"
             word <- sgetLine
             putStrLn "Try to guess it:"
             play word



sgetLine :: IO String

--Recursive Sequence

sgetLine = do x <- getCh
              if x == '\n' then
                 do putChar x
                    return []
              else
                do putChar '-'
                   xs <- sgetLine
                   return(x:xs)


getCh :: IO Char

getCh = do hSetEcho stdin False
           x <- getChar
           hSetEcho stdin True
           return x

play :: String -> IO ()

play word = do putStr "? "
               guess <- getLine
               if guess == word then
                  putStrLn "You got it!!"
               else
                  do putStrLn (match word guess)
                     play word


match :: String -> String -> String

match xs ys =  [if elem x ys then x else '-'| x<-xs]
