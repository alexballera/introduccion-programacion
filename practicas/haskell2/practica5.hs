{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

module Practica5 where

{-# HLINT ignore "Use foldr" #-}
import Test.HUnit

lista1 :: [Integer]
lista1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]

lista1igual :: [Integer]
lista1igual = [1, 2, 3, 4, 5, 6, 7, 8, 9]

iguales :: [Integer]
iguales = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1]

unoIgual :: [Integer]
unoIgual = [1, 2, 3, 4, 5, 6, 7, 8, 9, 1]

listaCapicua = ['a', 'b', 'c', 'b', 'a']

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
-- 2.1
pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece e (x : xs) = e == x || pertenece e xs

-- 2.2
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [x] = True
todosIguales (x : y : xs) = x == y && todosIguales (x : xs)

-- 2.3
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x : xs)
  | pertenece x xs = False
  | otherwise = todosDistintos xs

-- 2.4
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos [x] = False
hayRepetidos (x : xs)
  | pertenece x xs = True
  | otherwise = hayRepetidos xs

-- 2.5
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar n (x : xs)
  | n == x = xs
  | otherwise = x : quitar n xs

-- 2.6
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos n (x : xs)
  | n == x = quitarTodos n xs
  | otherwise = x : quitarTodos n xs

-- 2.7
eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos (x : xs)
  | not (pertenece x xs) = x : eliminarRepetidos xs
  | otherwise = eliminarRepetidos xs

-- 2.8
mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos xs ys = pertenecenTodos (eliminarRepetidos xs) (eliminarRepetidos ys) && pertenecenTodos (eliminarRepetidos ys) (eliminarRepetidos xs)
  where
    pertenecenTodos [] ys = True
    pertenecenTodos (x : xs) ys
      | pertenece x ys = pertenecenTodos xs ys
      | otherwise = False

-- 2.9
capicua :: (Eq t) => [t] -> Bool
capicua xs = xs == reverso xs

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
      "todosDistintos unoIgual" ~: todosDistintos unoIgual ~=? False,
      "hayRepetidos lista1" ~: hayRepetidos lista1 ~=? False,
      "hayRepetidos iguales" ~: hayRepetidos iguales ~=? True,
      "hayRepetidos unoIgual" ~: hayRepetidos unoIgual ~=? True,
      "quitar lista1" ~: quitar 9 lista1 ~=? [1, 2, 3, 4, 5, 6, 7, 8],
      "quitar iguales" ~: quitar 1 iguales ~=? [1, 1, 1, 1, 1, 1, 1, 1, 1],
      "quitarTodos lista1" ~: quitarTodos 9 lista1 ~=? [1, 2, 3, 4, 5, 6, 7, 8],
      "quitarTodos iguales" ~: quitarTodos 1 iguales ~=? [],
      "eliminarRepetidos lista1" ~: eliminarRepetidos lista1 ~=? lista1,
      "eliminarRepetidos iguales" ~: eliminarRepetidos iguales ~=? [1],
      "eliminarRepetidos unoIgual" ~: eliminarRepetidos unoIgual ~=? [2, 3, 4, 5, 6, 7, 8, 9, 1],
      "mismosElementos lista1" ~: mismosElementos lista1 lista1igual ~=? True,
      "mismosElementos unoIgual" ~: mismosElementos lista1 unoIgual ~=? True,
      "mismosElementos unoIgual" ~: mismosElementos lista1 iguales ~=? False,
      "capicua lista1" ~: capicua lista1 ~=? False,
      "capicua iguales" ~: capicua iguales ~=? True,
      "capicua listaCapicua" ~: capicua listaCapicua ~=? True
    ]

correrTest :: IO Counts
correrTest = runTestTT tests