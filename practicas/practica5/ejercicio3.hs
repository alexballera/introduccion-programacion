{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
module Ejercicio3 where
import Test.HUnit

lista1 :: [Integer]
lista1 = [1,2,3,4,5,6,7,8,9]
lista2 :: [Integer]
lista2 = [1,2,3,4,5,6,7,8,9,10,11]

-- ? 1. sumatoria :: [Integer] -> Integer
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- ? 2. productoria :: [Integer] -> Integer
productoria :: [Integer] -> Integer
productoria [] = 1
productoria (x:xs) = x * productoria xs

-- ? 3. maximo :: [Integer] -> Integer
maximo :: [Integer] -> Integer
maximo [x] = x
maximo (x:y:xs) | x >= y = maximo (x:xs)
                | otherwise = maximo (y:xs)

-- ? 4. sumarN :: Integer -> [Integer] -> [Integer]
sumarN :: Integer -> [Integer] -> [Integer]
sumarN _ [] = []
sumarN n (x:xs) = n + x : sumarN n xs

-- ? 5. sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarX x (x:xs)
                where
                sumarX _ [] = []
                sumarX n (x:xs) = n + x : sumarX n xs

-- ? 6. sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo [] = []
sumarElUltimo (x:xs) = mostrarUltimo (x:xs) + x : sumarElUltimo xs
                      where
                      mostrarUltimo [x] = x
                      mostrarUltimo (x:xs) = mostrarUltimo xs


-- ! TESTS
-- ? 6. sumarElUltimo
testSumarElUltimo :: Test
testSumarElUltimo = test [
  "sumarElUltimo lista1" ~: sumarElUltimo lista1 ~=? [10,11,12,13,14,15,16,17,18],
  "sumarElUltimo lista2" ~: sumarElUltimo lista2 ~=? [12,13,14,15,16,17,18,19,20,21,22]
 ]


-- ? 5. sumarElPrimero
testSumarElPrimero :: Test
testSumarElPrimero = test [
  "sumarElPrimero 2 lista1" ~: sumarElPrimero lista1 ~=? [2,3,4,5,6,7,8,9,10],
  "sumarElPrimero 2 lista2" ~: sumarElPrimero lista2 ~=? [2,3,4,5,6,7,8,9,10,11,12]
 ]
-- ? 4. sumarN
testSumarN :: Test
testSumarN = test [
  "sumar 2 lista1" ~: sumarN 2 lista1 ~=? [3,4,5,6,7,8,9,10,11],
  "sumar 2 lista2" ~: sumarN 2 lista2 ~=? [3,4,5,6,7,8,9,10,11,12,13]
 ]
-- ? 3. maximo
testMaximo :: Test
testMaximo = test [
  "maximo lista1" ~: maximo lista1 ~=? 9,
  "maximo lista2" ~: maximo lista2 ~=? 11
 ]
-- ? 2. productoria
testProductoria :: Test
testProductoria = test [
  "productoria lista1" ~: productoria lista1 ~=? 362880,
  "productoria lista2" ~: productoria lista2 ~=? 39916800
 ]

-- ? 1. sumatoria 
testSumatoria :: Test
testSumatoria = test [
  "Suma lista 1" ~: sumatoria lista1 ~=? 45,
  "Suma lista 2" ~: sumatoria lista2 ~=? 66
 ]


tests :: Test
tests = TestList [
  TestLabel "testSumatoria" testSumatoria,
  TestLabel "testProductoria" testProductoria,
  TestLabel "testMaximo" testMaximo,
  TestLabel "testSumarN" testSumarN,
  TestLabel "testSumarElPrimero" testSumarElPrimero,
  TestLabel "testSumarElUltimo" testSumarElUltimo
 ]


correrTests :: IO Counts
correrTests = runTestTT tests