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
lista6 :: [Integer]
lista6 = [1,2,3,4,5,6,7,8,9]
lista7 :: [Integer]
lista7 = [1,2,3,4,5,6,7,8,9,1]
lista8 :: [Integer]
lista8 = [1,2,3,4,5,6,7,8,9,11]
lista9 :: [Integer]
lista9 = [1,2,3,4,5,6,7,8,9,11]

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

-- ? 4. hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = primeroRepetido (x:xs) || hayRepetidos xs
                    where primeroRepetido [x] = False
                          primeroRepetido (x:y:xs) | x /= y = primeroRepetido (x:xs)
                                                   | otherwise = True
-- ? 5. quitar :: (Eq t) => t -> [t] -> [t]
quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar n (x:xs) | n == x = xs
                | otherwise = x : quitar n xs

-- ? 6. quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos n (x:xs) | n == x = quitarTodos n xs
                     | otherwise = x : quitarTodos n xs

-- ? 7. eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos :: Eq a => [a] -> [a]
eliminarRepetidos (x:xs) = x : quitarRepetidos x (x:xs)
                         where quitarRepetidos _ [] = []
                               quitarRepetidos n (x:xs) | n == x = quitarRepetidos n xs
                                                        | otherwise = x : quitarRepetidos n xs

-- ? 8. mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos :: Eq t => [t] -> [t] -> Bool
mismosElementos (x:xs) (y:ys) = todosPertenecen (x:xs) (y:ys) && todosPertenecen (y:ys) (x:xs)
                              where
                              todosPertenecen [] (y:ys) = True 
                              todosPertenecen (x:xs) (y:ys) = primerElementoPertenece x (y:ys) && todosPertenecen xs (y:ys)
                              primerElementoPertenece _ [] = False
                              primerElementoPertenece x (y:ys) | x == y = True
                                                              | otherwise = primerElementoPertenece x ys
-- ? 9. capicua :: (Eq t) => [t] -> Bool
reverso :: (Eq t) => [t] -> [t]
reverso [] = []
reverso (x:xs) = ultimo (x:xs)
              where ultimo [x] = [x]
                    ultimo (x:xs) = ultimo xs
-- ! TESTS
-- ? 8. mismosElementos 
testMismosElementos :: Test
testMismosElementos = test [
  "testMismosElementos lista6 lista7" ~: mismosElementos lista6 lista7 ~=? True,
  "testMismosElementos lista8 lista9" ~: mismosElementos lista8 lista9 ~=? True
 ]


-- ? 7. eliminarRepetidos
testEliminarRepetidos :: Test
testEliminarRepetidos = test [
  "testEliminarRepetidos lista1" ~: eliminarRepetidos lista1 ~=? ["a", "b", "c"],
  "testEliminarRepetidos lista4" ~: eliminarRepetidos lista4 ~=? ["a"],
  "testEliminarRepetidos lista5" ~: eliminarRepetidos lista5 ~=? ["a", "b", "c", "d"],
  "testEliminarRepetidos lista7" ~: eliminarRepetidos lista7 ~=? [1,2,3,4,5,6,7,8,9]
 ]

-- ? 6. quitarTodos
testQuitarTodos :: Test
testQuitarTodos = test [
  "testQuitarTodos 'a' lista4" ~: quitarTodos "a" lista4 ~=? [],
  "testQuitarTodos 'a' lista5" ~: quitarTodos "a" lista5 ~=? ["b", "c", "d"],
  "testQuitarTodos 1 lista6" ~: quitarTodos 1 lista6 ~=? [2,3,4,5,6,7,8,9],
  "testQuitarTodos 1 lista7" ~: quitarTodos 1 lista7 ~=? [2,3,4,5,6,7,8,9]
 ]
-- ? 5. quitar
testQuitar :: Test
testQuitar = test [
  "testQuitar 'a' lista1" ~: quitar "a" lista1 ~=? ["b", "c"],
  "testQuitar 'b' lista2" ~: quitar "b" lista2 ~=? ["a", "c", "d", "e"],
  "testQuitar 'c' lista3" ~: quitar "c" lista3 ~=? ["a", "b", "d", "e", "f", "g"],
  "testQuitar 'b' lista4" ~: quitar "b" lista4 ~=? ["a", "a", "a", "a", "a"],
  "testQuitar 'a' lista5" ~: quitar "a" lista5 ~=? ["b", "c", "d", "a"],
  "testQuitar 1 lista6" ~: quitar 1 lista6 ~=? [2,3,4,5,6,7,8,9],
  "testQuitar 1 lista7" ~: quitar 1 lista7 ~=? [2,3,4,5,6,7,8,9,1]
 ]
-- ? 4. hayRepetidos
testHayRepetidos :: Test
testHayRepetidos = test [
  "testHayRepetidos lista1" ~: hayRepetidos lista1 ~=? False,
  "testHayRepetidos lista2" ~: hayRepetidos lista2 ~=? False,
  "testHayRepetidos lista3" ~: hayRepetidos lista3 ~=? False,
  "testHayRepetidos lista4" ~: hayRepetidos lista4 ~=? True,
  "testHayRepetidos lista5" ~: hayRepetidos lista5 ~=? True
 ]
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
  TestLabel "testTodosDistintos" testTodosDistintos,
  TestLabel "testHayRepetidos" testHayRepetidos,
  TestLabel "testQuitar" testQuitar,
  TestLabel "testQuitarTodos" testQuitarTodos,
  TestLabel "testEliminarRepetidos" testEliminarRepetidos,
  TestLabel "testMismosElementos" testMismosElementos
 ]

correrTests :: IO Counts
correrTests = runTestTT tests