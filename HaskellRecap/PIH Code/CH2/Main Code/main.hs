double :: Num a => a -> a

double x =  x+x

quadruple :: Num a => a -> a

quadruple  = double . double


myfactorial :: (Integral a) => a -> a

myfactorial 0 = 1

myfactorial x = x * myfactorial (x-1)

