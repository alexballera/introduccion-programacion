{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module Practica5 where

{-# HLINT ignore "Use foldr" #-}
import Test.HUnit

lista1 :: [Integer]
lista1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]

iguales :: [Integer]
iguales = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

unoIgual :: [Integer]
unoIgual = [1, 2, 3, 4, 5, 6, 7, 8, 9, 1]

-- ! Ejercicio 1
-- 1a
longitud :: [t] -> Integer
longitud [] = 0
longitud (x : xs) = 1 + longitud xs

-- 1b
ultimo :: [t] -> t
ultimo [x] = x
ultimo (x : xs) = ultimo xs

-- 1c
principio :: [t] -> [t]
principio [x] = []
principio (x : xs) = x : principio xs

-- 1d
reverso :: [t] -> [t]
reverso [] = []
reverso xs = ultimo xs : reverso (principio xs)

-- ! Ejercicio 2
-- 2a
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x : xs) = e == x || pertenece e xs

-- 2b
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [x] = True
todosIguales (x : y : xs) = x == y && todosIguales (x : xs)

-- 2c
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = False
todosDistintos [x] = False
todosDistintos (x : xs)
  | not (pertenece x xs) = True
  | otherwise = todosDistintos xs

tests :: Test
tests =
  TestList
    [ "longitud" ~: longitud lista1 ~=? 9,
      "ultimo" ~: ultimo lista1 ~=? 9,
      "principio" ~: principio lista1 ~=? [1, 2, 3, 4, 5, 6, 7, 8],
      "reverso" ~: reverso lista1 ~=? [9, 8, 7, 6, 5, 4, 3, 2, 1],
      "pertenece" ~: pertenece 1 lista1 ~=? True,
      "pertenece" ~: pertenece 10 lista1 ~=? False,
      "todosIguales" ~: todosIguales lista1 ~=? False,
      "todosIguales" ~: todosIguales iguales ~=? True,
      "todosIguales" ~: todosIguales unoIgual ~=? False,
      "todosDistintos lista1" ~: todosDistintos lista1 ~=? True,
      "todosDistintos iguales" ~: todosDistintos iguales ~=? False,
      "todosDistintos unoIgual" ~: todosDistintos unoIgual ~=? True
    ]

correrTest :: IO Counts
correrTest = runTestTT tests