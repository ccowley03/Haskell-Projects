-- Necessary Imports Here
import Data.Char
import Data.List
import System.IO
-------------------------

size ::Int

size = 3

data Player =  O | B | X --The type player can be either of these values and is both Showable/Ordable
            deriving (Eq,Ord,Show)



type Grid = [[Player]]

next :: Player -> Player

next O = X

next B = B

next X = O


empty :: Grid

empty = replicate size (replicate size B)


full :: Grid -> Bool

full = all (/=B) . concat


turn :: Grid -> Player

turn g = if os <= xs then O else X 
         where -- the values produced below will then be used in the expression above
            os = length (filter (== O) ps) -- sam e here
            xs = length (filter (== X) ps) --filters the list to produce a list of only Os
            ps = concat g  --Flattens the 2D List (Grid) to 1D List



diag :: Grid -> [Player]

diag g = [g !! n !! n | n <-[0..size-1]]




wins :: Player -> Grid -> Bool

wins p g = any line (rows ++ cols ++ dias)
           where --Locals
           line = all (== p)
           rows = g
           cols =  transpose g --flipping rows and columns
           dias = [diag g, diag (map reverse g)]



won  :: Grid -> Bool

won g = wins O g || wins X g


putGrid :: Grid -> IO ()

putGrid =
    putStrLn . unlines  . concat . interleave bar . map showRow
    where bar = [replicate ((size*4)-1)'-']



showRow :: [Player] -> [String]

showRow = beside . interleave bar . map showPlayer
          where
            beside = foldr1 (zipWith (++))
            bar = replicate 3 "|"



showPlayer :: Player -> [String]

showPlayer O = ["   "," O ","   "]
showPlayer B = ["   ","   ","   "]
showPlayer X = ["   "," X ","   "]


-- Puts a value between each element in the list

-- e.g interleave 0 [1,2] = 1 : 0 :(interleave 0 [2]) = 1:0:2:[]


interleave :: a -> [a] -> [a]

interleave x [] = []

interleave x [y] = [y]
interleave x (y:ys) = y : x :interleave x ys

-----------------------------------------------------------------



valid :: Grid -> Int -> Bool

-- Bounds checking and empty presence check
valid g i = 0<= i && i <size^2 && concat g !! i == B



move :: Grid -> Int -> Player -> [Grid]

move g i p = 
    if valid g i then [chop size (xs ++ [p]++ys)] else []
    where (xs,B:ys) = splitAt i (concat g)


chop :: Int -> [a] -> [[a]]

chop n [] = []

--splits list into sub lists depending on the depth i.e chop 3 [1,2,3,4] would split at the 3rd element and leave two lists
---        [[1,2,3],[4]]


chop n xs = take n xs : chop n(drop n xs)

getNat :: String -> IO Int

getNat prompt = do putStr prompt
                   xs <- getLine
                   if xs /= [] && all isDigit xs then
                    return(read xs)

                   else
                    do putStrLn "ERROR: Number not valid"
                       getNat prompt





tictactoe :: IO ()

tictactoe = run empty O --Noughts starts first

--Screen Utilities

cls :: IO()

cls =  putStr "\ESC[2J"


type Pos =  (Int,Int)

goto :: Pos -> IO()

goto (x,y) = putStr ("\ESC[" ++ show y ++ ";" ++ show x ++ "H")

prompt :: Player -> String

prompt p = "Player " ++ show p ++ ", enter your move: "

-------------------------------

run :: Grid -> Player -> IO ()


run g p = do cls
             goto (1,1)
             putGrid g
             run' g p


run' :: Grid -> Player -> IO()

run' g p | wins O g = putStrLn "Player O wins!\n"
         | wins X g = putStrLn "Player X wins!\n"
         | full g   = putStrLn "It's a draw!\n"
         | otherwise =
            do i <- getNat (prompt p)
               case move g i p of
                  [] -> do putStrLn "ERROR: INVALID MOVE"
                           run' g p
                  [g'] -> run g' (next p)


