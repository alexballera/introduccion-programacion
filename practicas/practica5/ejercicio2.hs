{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
module Ejercicio2 where
import Test.HUnit

lista1 :: [String]
lista1 = ["a", "b", "c"]
lista2 :: [String]
lista2 = ["a", "b", "c", "d", "e"]
lista3 :: [String]
lista3 = ["a", "b", "c", "d", "e", "f", "g"]
lista4 :: [String]
lista4 = ["a", "a", "a", "a", "a"]
lista5 :: [String]
lista5 = ["a", "b", "c", "d", "a"]

-- ? 1. pertenece :: (Eq t) => t -> [t] -> Bool
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece x (y:ys) = x == y || pertenece x ys

-- ? 2. todosIguales :: (Eq t) => [t] -> Bool
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [y] = True
todosIguales (x:y:ys) = x == y && todosIguales (y:ys) || False

-- ? 3. todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs) = primeroDistinto x xs && todosDistintos xs
                      where primeroDistinto _ [] = True
                            primeroDistinto n (x:xs) = n /= x && primeroDistinto n xs || False

-- ! TESTS
-- ? 3. todosDistintos
testTodosDistintos :: Test
testTodosDistintos = test [
  "todosDistintos lista1" ~: todosDistintos lista1 ~=? True,
  "todosDistintos lista2" ~: todosDistintos lista2 ~=? True,
  "todosDistintos lista3" ~: todosDistintos lista3 ~=? True,
  "todosDistintos lista4" ~: todosDistintos lista4 ~=? False,
  "todosDistintos lista5" ~: todosDistintos lista5 ~=? False
 ]

-- ? 2. todosIguales
testTodosIguales :: Test
testTodosIguales = test [
  "todosIguales lista1" ~: todosIguales lista1 ~=? False,
  "todosIguales lista2" ~: todosIguales lista2 ~=? False,
  "todosIguales lista3" ~: todosIguales lista3 ~=? False,
  "todosIguales lista4" ~: todosIguales lista4 ~=? True
 ]

-- ? 1. pertenece
testPertenece :: Test
testPertenece = test [
  "pertenece 'a' lista1" ~: pertenece "a" lista1 ~=? True,
  "pertenece 'b' lista1" ~: pertenece "b" lista1 ~=? True,
  "pertenece 'c' lista1" ~: pertenece "c" lista1 ~=? True,
  "pertenece 'd' lista1" ~: pertenece "d" lista1 ~=? False
 ]

tests :: Test
tests = TestList [
  TestLabel "testPertenece" testPertenece,
  TestLabel "testTodosIguales" testTodosIguales,
  TestLabel "testTodosDistintos" testTodosDistintos
 ]

correrTests :: IO Counts
correrTests = runTestTT tests