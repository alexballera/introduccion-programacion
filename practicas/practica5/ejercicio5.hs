{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use map" #-}
{-# HLINT ignore "Use :" #-}
module Ejercicio5 where
import Test.HUnit

lista1 :: [Integer]
lista1 = [1,2,3,4,5]
lista2 :: [Integer]
lista2 = [3,4,5,6,7,8,9]
lista3 :: [Integer]
lista3 = [2, 10, 6]

-- ? 1. sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada xs = sumaAcumulada (quitarUltimo xs) ++ [sumarNumeros xs]
  where
    quitarUltimo [x] = []
    quitarUltimo (x:xs) = x : quitarUltimo xs
    sumarNumeros [] = 0
    sumarNumeros (x:xs) = x + sumarNumeros xs

-- ? 2. descomponerEnPrimos :: [Integer] -> [[Integer]]
mostrarPrimos :: Integer -> Integer -> [Integer]
mostrarPrimos n i | n == i = [i]
 | mod n i == 0 = [i] ++ mostrarPrimos n (i + 1)
 | otherwise = mostrarPrimos n (i + 1)

-- ? TESTS
-- ? 1. sumaAcumulada
testSumaAcumulada :: Test
testSumaAcumulada = test [
  "sumaAcumulada lista1" ~: sumaAcumulada lista1 ~=? [1,3,6,10,15],
  "sumaAcumulada lista2" ~: sumaAcumulada lista2 ~=? [3,7,12,18,25,33,42]
 ]

tests :: Test
tests = TestList [
  TestLabel "testSumaAcumulada" testSumaAcumulada
 ]

correrTests :: IO Counts
correrTests = runTestTT tests