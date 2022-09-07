
myall :: (a -> Bool) -> [Bool] -> Bool

myall p = and . map p

