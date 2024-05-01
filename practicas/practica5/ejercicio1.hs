{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use map" #-}
import Test.HUnit
lista1 :: [String]
lista1 = ["a", "b", "c"]
lista2 :: [String]
lista2 = ["a", "b", "c", "d", "e", "f", "g"]
lista3 :: [String]
lista3 = ["a", "b", "c", "d", "e"]

-- ? 1. longitud :: [t] -> Integer
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
reverso (x:xs) = ultimoA (x:xs) : reverso ( principioA (x:xs))
               where ultimoA [x] = x
                     ultimoA (x:xs) = ultimo xs
                     principioA [x] = []
                     principioA (x:xs) = x : principioA xs 

{- reverso [] = []
reverso (x:xs) = ultimo (x:xs) : reverso ( principio (x:xs)) -}

testReverso :: Test
testReverso = test [
  "reverso lista1" ~: reverso lista1 ~=? ["c", "b", "a"],
  "reverso lista2" ~: reverso lista2 ~=? ["g", "f", "e", "d", "c", "b", "a"],
  "reverso lista3" ~: reverso lista3 ~=? ["e", "d", "c", "b", "a"]
 ]
testPrincipio :: Test
testPrincipio = test [
  "principio lista1" ~: principio lista1 ~=? ["a", "b"],
  "principio lista2" ~: principio lista2 ~=? ["a", "b", "c", "d", "e", "f"],
  "principio lista3" ~: principio lista3 ~=? ["a", "b", "c", "d"]
 ]

testUltimo :: Test
testUltimo = test [
  "Ultimo lista1" ~: ultimo lista1 ~=? "c",
  "Ultimo lista2" ~: ultimo lista2 ~=? "g",
  "Ultimo lista3" ~: ultimo lista3 ~=? "e"
 ]

testLongitud :: Test
testLongitud = test [
  "Longitud lista1" ~: longitud lista1 ~=? 3,
  "Longitud lista2" ~: longitud lista2 ~=? 7,
  "Longitud lista3" ~: longitud lista3 ~=? 5
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