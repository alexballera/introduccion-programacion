{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use list literal pattern" #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use null" #-}
{-# HLINT ignore "Evaluate" #-}
module Ejercicio4 where
import Test.HUnit

lista1 :: String
lista1 = "Ho    la m  u  n  d  o"
lista2 :: String
lista2 = "Esta  es una prueba     de haskell con    hola mundo"
lista3 :: [String]
lista3 = ["Esta","es","una","prueba","de","haskell","con","hola","mundo"]

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
palabraMasLarga xs =  eliminaEspacioFinal (laMasLarga xs)
  where
  laMasLarga [x] = [x]
  laMasLarga xs | lengthA (primeraPalabra xs ) >= lengthA (laMasLarga (eliminaPrimeraPalabra xs)) = primeraPalabra xs
                | otherwise = laMasLarga (eliminaPrimeraPalabra xs)
  lengthA [] = 0
  lengthA (x:xs) = 1 + lengthA xs
  primeraPalabra [] = []
  primeraPalabra (x:xs) | x /= ' ' = x : primeraPalabra xs
                        | otherwise = [x]
  eliminaPrimeraPalabra [x] = [x]
  eliminaPrimeraPalabra (x:xs) | x == ' ' = xs
                               | otherwise = eliminaPrimeraPalabra (eliminaEspacios xs)
  eliminaEspacioFinal [] = []
  eliminaEspacioFinal (x:xs) | x /= ' ' = x : eliminaEspacioFinal xs
                             | otherwise = eliminaEspacioFinal xs
  eliminaEspacios [x] = [x]
  eliminaEspacios (x:y:xs) | x == y && y == ' ' = eliminaEspacios (x:xs)
                           | otherwise = x : eliminaEspacios (y:xs)

-- ? e) aplanar :: [[Char]] -> [Char]
aplanar :: [[Char]] -> [Char]
aplanar [] = []
aplanar (x:xs) = x ++ aplanar xs

-- ? f ) aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos :: [[Char]] -> [Char]
aplanarConBlancos [] = []
aplanarConBlancos (x:[]) = x ++ []
aplanarConBlancos (x:xs) = (x ++ " ") ++ aplanarConBlancos xs

-- ? g) aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos :: [[Char]] -> Integer -> [Char]
aplanarConNBlancos [] _ = []
aplanarConNBlancos (x:[]) _ = x ++ []
aplanarConNBlancos (x:xs) n = (x ++ nEspacios n) ++ aplanarConNBlancos xs n
  where
  nEspacios 0 = []
  nEspacios n = " " ++ nEspacios (n - 1)

-- ? TESTS
-- ? g) aplanarConNBlancos
testAplanarConNBlancos :: Test
testAplanarConNBlancos = test [
  "aplanarConNBlancos lista3 1" ~: aplanarConNBlancos lista3 1 ~=? "Esta es una prueba de haskell con hola mundo",
  "aplanarConNBlancos lista3 2" ~: aplanarConNBlancos lista3 2 ~=? "Esta  es  una  prueba  de  haskell  con  hola  mundo",
  "aplanarConNBlancos lista3 3" ~: aplanarConNBlancos lista3 3 ~=? "Esta   es   una   prueba   de   haskell   con   hola   mundo"
 ]
-- ? f ) aplanarConBlancos
testAplanarConBlancos :: Test
testAplanarConBlancos = test [
  "aplanarConBlancos lista3" ~: aplanarConBlancos lista3 ~=? "Esta es una prueba de haskell con hola mundo"
 ]
-- ? e) aplanar
testAplanar :: Test
testAplanar = test [
  "aplanar lista2" ~: aplanar lista3 ~=? "Estaesunapruebadehaskellconholamundo"
 ]
-- ? d) palabraMasLarga
testPalabraMasLarga :: Test
testPalabraMasLarga = test [
  "palabraMasLarga lista1" ~: palabraMasLarga lista1 ~=? "Ho",
  "palabraMasLarga lista2" ~: palabraMasLarga lista2 ~=? "haskell"
 ]

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
  TestLabel "testPalabras" testPalabras,
  TestLabel "testPalabraMasLarga" testPalabraMasLarga,
  TestLabel "testAplanar" testAplanar,
  TestLabel "testAplanarConBlancos" testAplanarConBlancos,
  TestLabel "testAplanarConNBlancos" testAplanarConNBlancos
 ]

correrTests :: IO Counts
correrTests = runTestTT tests