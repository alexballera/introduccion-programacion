{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use list literal pattern" #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use null" #-}
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
                              sacarVaciosRepetidos (x:y:xs) | x == y && x == ' ' = sacarVaciosRepetidos (y:xs)
                                                            | otherwise = x: sacarVaciosRepetidos (y:xs)
-- ? c) palabras :: [Char] -> [[Char]]
palabras :: [Char] -> [[Char]]
palabras [] = []
palabras xs = primeraPalabra (sacarBlancosRepetidos xs) : palabras (eliminaPrimerEspacio (eliminaPrimeraPalabra (sacarBlancosRepetidos xs)))
            where
            primeraPalabra [] = []
            primeraPalabra (x:xs) | x == ' ' = []
                                  | otherwise = x : primeraPalabra xs
            eliminaPrimeraPalabra [] = []
            eliminaPrimeraPalabra (x:xs) | x == ' ' = xs
                                        | otherwise = eliminaPrimeraPalabra xs
            eliminaPrimerEspacio [] = []
            eliminaPrimerEspacio (x:xs) | x == ' ' = xs
                                        | otherwise = x:xs

-- ? d) palabraMasLarga :: [Char] -> [Char]
palabraMasLarga :: [Char] -> [Char]
palabraMasLarga xs = laMasLarga (eliminaPrimerEspacio (eliminaUltimoEspacio (sacarBlancosRepetidos xs)))

laMasLarga :: [Char] -> [Char]
laMasLarga xs | eliminaPrimeraPalabra xs == [] = primeraPalabra xs
              | lengthA (primeraPalabra xs) > lengthA (laMasLarga (eliminaPrimeraPalabra xs)) = primeraPalabra xs
              | otherwise = laMasLarga (eliminaPrimeraPalabra xs)

lengthA :: Num a1 => [a2] -> a1
lengthA [] = 0
lengthA (x:xs) = 1 + lengthA xs

primeraPalabra :: [Char] -> [Char]
primeraPalabra [] = []
primeraPalabra (x:xs) | x == ' ' = []
                      | otherwise = x : primeraPalabra xs

eliminaPrimeraPalabra :: [Char] -> [Char]
eliminaPrimeraPalabra [] = []
eliminaPrimeraPalabra (x:xs) | x == ' ' = xs
                            | otherwise = eliminaPrimeraPalabra xs

eliminaPrimerEspacio :: [Char] -> [Char]
eliminaPrimerEspacio [] = []
eliminaPrimerEspacio (x:xs) | x == ' ' = xs
                            | otherwise = x:xs

eliminaUltimoEspacio :: [Char] -> [Char]
eliminaUltimoEspacio [] = []
eliminaUltimoEspacio (x:[]) | x == ' ' = []
                            | otherwise = [x]
eliminaUltimoEspacio (x:xs) = x : eliminaUltimoEspacio xs

-- ? TESTS
-- ? c) palabras
testPalabras :: Test
testPalabras = test [
  "palabras lista 1" ~: palabras lista1 ~=? ["Ho","la","m","u","n","d","o"],
  "palabras lista 2" ~: palabras lista2 ~=? ["Esta","es","una","prueba","de","haskell","con","hola","mundo"]
 ]
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
  TestLabel "testContarPalabras" testContarPalabras,
  TestLabel "testPalabras" testPalabras
 ]

correrTests :: IO Counts
correrTests = runTestTT tests