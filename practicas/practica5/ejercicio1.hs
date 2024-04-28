{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use map" #-}
import Test.HUnit
lista1 :: [String]
lista1 = ["azul", "rojo", "amarillo", "naranja", "marron"]
lista2 :: [String]
lista2 = ["manzana", "pera", "mango", "coco"]

-- ! Ejercicio 1. Definir las siguientes funciones sobre listas:
-- ? 1. longitud :: [t] -> Integer, que dada una lista devuelve su cantidad de elementos.
longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

-- ? 2. ultimo :: [t] -> t
ultimo :: [t] -> t
ultimo [x] = x
ultimo (x:xs) = ultimo xs

-- ? 3. principio :: [t] -> [t]
principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio xs

-- ? 4. reverso :: [t] -> [t]
reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = elUltimo (x:xs) : reverso (quitaElUltimo (x:xs) )
               where elUltimo [x] = x
                     elUltimo (x:xs) = elUltimo xs
                     quitaElUltimo [x] = []
                     quitaElUltimo (x:xs) = x : quitaElUltimo xs

-- ! TESTS
-- ? 1. longitud 
testLongitud :: Test
testLongitud = test [
  "Longitud Lista 1:" ~: longitud lista1 ~=? 5,
  "Longitud Lista 2:" ~: longitud lista2 ~=? 4
 ]

-- ? 2. ultimo
testUltimo :: Test
testUltimo = test [
  "Ultimo Lista 1" ~: ultimo lista1 ~=? "marron",
  "Ultimo Lista 2" ~: ultimo lista2 ~=? "coco",
  "Ultimo Lista 2" ~: ultimo lista2 ~=? "coco"
 ]

-- ? 3. principio
testPrincipio :: Test
testPrincipio = test [
  "Principio lista1" ~: principio lista1 ~=? ["azul","rojo","amarillo","naranja"],
  "Principio lista2" ~: principio lista2 ~=? ["manzana","pera","mango"]
 ]

-- ? 4. reverso
testReverso :: Test
testReverso = test [
  "Reverso lista 1" ~: reverso lista1 ~=? ["marron","naranja","amarillo","rojo","azul"],
  "Reverso lista 2" ~: reverso lista2 ~=? ["coco","mango","pera","manzana"]
 ]

tests :: Test
tests = TestList [
  TestLabel "testLongitud" testLongitud,
  TestLabel "testUltimo" testUltimo,
  TestLabel "testPrincipio" testPrincipio,
  TestLabel "testReverso" testReverso
 ]

correrTest :: IO Counts
correrTest = runTestTT tests
