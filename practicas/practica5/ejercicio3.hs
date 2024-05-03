{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use even" #-}
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

-- ? 7. pares :: [Integer] -> [Integer]
pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) | mod x 2 == 0 = x : pares xs
             | otherwise = pares xs

-- ? 8. multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs) | mod x n == 0 = x : multiplosDeN n xs
                      | otherwise = multiplosDeN n xs

-- ? 9. ordenar :: [Integer] -> [Integer]
ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar xs = numeroMenor xs : ordenar (quitarN (numeroMenor xs) xs)
                where
                quitarN _ [] = []
                quitarN n (x:xs) | n == x = quitarN n xs
                                | otherwise = x : quitarN n xs
                numeroMenor [x] = x
                numeroMenor (x:y:xs) | x <= y = numeroMenor (x:xs)
                                      | otherwise = numeroMenor (y:xs)
-- ! TESTS
-- ? 9. ordenar
testOrdenar :: Test
testOrdenar = test [
  "ordenar lista1" ~: ordenar lista1 ~=? [9,8,7,6,5,4,3,2,1],
  "ordenar lista2" ~: ordenar lista2 ~=? [11,10,9,8,7,6,5,4,3,2,1]
 ]

-- ? 8. multiplosDeN
testMultiplosDeN :: Test
testMultiplosDeN = test [
  "multiplosDeN 2 linta1" ~: multiplosDeN 2 lista1 ~=? [2,4,6,8],
  "multiplosDeN 3 linta1" ~: multiplosDeN 3 lista1 ~=? [3,6,9],
  "multiplosDeN 4 linta1" ~: multiplosDeN 4 lista1 ~=? [4,8]
 ]

-- ? 7. pares
testPares :: Test
testPares = test [
  "pares lista1" ~: pares lista1 ~=? [2,4,6,8],
  "pares lista2" ~: pares lista2 ~=? [2,4,6,8,10]
 ]

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
  TestLabel "testSumarElUltimo" testSumarElUltimo,
  TestLabel "testPares" testPares,
  TestLabel "testMultiplosDeN" testMultiplosDeN,
  TestLabel "testOrdenar" testOrdenar
 ]

correrTests :: IO Counts
correrTests = runTestTT tests