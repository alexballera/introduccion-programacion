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
menorDivisorAux::Integer->Integer->Integer
menorDivisorAux a i  | mod a i == 0 =i
                     | otherwise = menorDivisorAux a (i+1)

menorDivisor::Integer->Integer
menorDivisor n = menorDivisorAux n 2
--La recursion de menorDivisorAux arranca en 2 y va subiendo hasta encontrar el primer múltiplo

factoresPrimos :: Integer -> [Integer]
factoresPrimos 1 = []
factoresPrimos n = menorFactor : factoresPrimos (div n menorFactor)
        where menorFactor = menorDivisor n

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = factoresPrimos x : descomponerEnPrimos xs


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