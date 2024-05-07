{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use map" #-}
module Ejercicio5 where
import Test.HUnit

lista1 :: [Integer]
lista1 = [1,2,3,4,5]
lista2 :: [Integer]
lista2 = [3,4,5,6,7,8,9]

-- ? 1. sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada xs = reverseLista (sumaAcumuladaAux xs)
  where
    sumaAcumuladaAux [] = []
    sumaAcumuladaAux xs = sumarNumeros xs : sumaAcumuladaAux (quitarUltimo xs)
    reverseLista [] = []
    reverseLista (x:xs) = mostrarUltimo (x:xs) : reverseLista (quitarUltimo (x:xs))
    mostrarUltimo [x] = x
    mostrarUltimo (x:xs) = mostrarUltimo xs
    quitarUltimo [x] = []
    quitarUltimo (x:xs) = x : quitarUltimo xs
    sumarNumeros [] = 0
    sumarNumeros (x:xs) = x + sumarNumeros xs

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