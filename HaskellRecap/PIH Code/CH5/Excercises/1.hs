
sums :: Int -> Int

sums x = sum([x^2|x<-[1..x]])


grid :: Int ->Int -> [(Int,Int)]

grid x y = [(b,c)| b<-[0..x], c <-[0..y]]
  

square :: Int -> [(Int,Int)]

square x = [(b,c)|b<-[0..x],c<-[0..x],b/=c]

pyths :: Int -> [(Int,Int,Int)]

pyths n = [(x,y,z)| x <- [1..n],
                    y <- [1..n],
                    z <- [1..n],
                    x^2 + y^2 == z^2]



