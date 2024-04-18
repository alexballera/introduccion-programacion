-- Recursión sobre listas (pág 15)
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use null" #-}
{-# OPTIONS_GHC -Wno-overlapping-patterns #-}

-- ! Longitud 
longitud :: Num a1 => [a2] -> a1
longitud [] = 0
longitud (x:xs) = 1 + longitud xs
longitud xs = 1 + longitud (tail xs)

esVacia :: Eq a => [a] -> Bool
esVacia xs = xs == []

longitudB :: (Eq a1, Num a2) => [a1] -> a2
longitudB xs
 | esVacia xs = 0
 | otherwise = 1 + longitudB (tail xs)

-- ! Pertenece
pertenece :: Int -> [Int] -> Bool
pertenece _ [] = False
pertenece x (y:xs)
 | x == y = True
 | otherwise = pertenece x xs

  -- Sin guardas
{- pertenece _ [] = False
pertenece x xs = head xs == x || pertenece x (tail xs) -}
