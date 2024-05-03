{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use list literal pattern" #-}
module Ejercicio4 where
import Test.HUnit
import Data.Bits (Bits(xor))

lista1 :: String
lista1 = "Ho    la m  u  n  d  o"
lista2 :: String
lista2 = "Esta  es una prueba     de haskell con    hola mundo"

-- ? a) sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:[]) = [x]
sacarBlancosRepetidos (x:y:xs) | x == y && x == ' ' = sacarBlancosRepetidos (y:xs)
                               | otherwise = x : sacarBlancosRepetidos (y:xs)

-- ? b) contarPalabras :: [Char] -> Integer,
contarPalabras :: [Char] -> Integer
contarPalabras [] = 0
contarPalabras (x:[]) = 1
contarPalabras (x:y:xs) | x == y && x == ' ' = contarPalabras (sacarVaciosRepetidos (x:y:xs))
                        | x == ' ' = 1 + contarPalabras (y:xs)
                        | otherwise = contarPalabras (y:xs)
                        where sacarVaciosRepetidos [] = []
                              sacarVaciosRepetidos (x:[]) = [x]
                              sacarVaciosRepetidos (x:y:xs) | x == y && x == ' ' = sacarVaciosRepetidos(y:xs)
                                                            | otherwise = x: sacarVaciosRepetidos(y:xs)

-- ? TESTS
-- ? b) contarPalabras
testContarPalabras :: Test
testContarPalabras = test [
  "contar lista1" ~: contarPalabras lista1 ~=? 7,
  "contar lista2" ~: contarPalabras lista2 ~=? 9
 ]

-- ? a) sacarBlancosRepetidos
testSacarBlancosRepetidos :: Test
testSacarBlancosRepetidos = test [
  "sacar lista1" ~: sacarBlancosRepetidos lista1 ~=? "Ho la m u n d o",
  "sacar lista1" ~: sacarBlancosRepetidos lista2 ~=? "Esta es una prueba de haskell con hola mundo"
 ]

tests = TestList [
  TestLabel "testSacarBlancosRepetidos" testSacarBlancosRepetidos,
  TestLabel "testContarPalabras" testContarPalabras
 ]

correrTests :: IO Counts
correrTests = runTestTT tests