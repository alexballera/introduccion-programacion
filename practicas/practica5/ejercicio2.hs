{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use map" #-}
import Test.HUnit
lista1 :: [String]
lista1 = ["azul", "rojo", "amarillo", "azul", "naranja", "marron", "azul"]
lista2 :: [String]
lista2 = ["manzana", "pera", "mango", "coco"]
lista3 :: [String]
lista3 = ["a", "a", "a", "a"]

-- ! Ejercicio 2. Definir las siguientes funciones sobre listas

-- ? 1 pertenece :: (Eq t) => t -> [t] -> Bool
{-
según la siguiente especificación

problema pertenece (e: T , s: seq⟨T ⟩) : B {
  requiere: { T rue }
  asegura: { resultado = true ↔ e ∈ s }
}
-}

pertenece :: (Eq t) => t -> [t] -> Bool

pertenece _ [] = False
pertenece x (y:ys) | x == y = True
                   | otherwise = pertenece x ys

-- ? 2. todosIguales :: (Eq t) => [t] -> Bool,
todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales (x:y:xs) | x == y = todosIguales xs
                      | otherwise = False

-- ? 3. todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos (x:xs) | primeroDistinto (x:xs) = todosDistintos xs
                      | otherwise = False
                      where primeroDistinto [x] = True
                            primeroDistinto (x:y:xs) = x /= y && primeroDistinto (x:xs)

-- ? 4 hayRepetidos
hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = comparaPrimero (x:xs)
                    where comparaPrimero [x] = False 
                          comparaPrimero (x:y:xs) | x == y = True 
                                                  | otherwise = comparaPrimero (x:xs) 

-- ? 5 quitar
{-
? Implementar quitar :: (Eq t) => t -> [t] -> [t], que
? dados un entero x y una lista xs, elimina la primera aparición de x
? en la lista xs (de haberla)
}
-}

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar x (y:ys)
 | x == y = ys
 | otherwise = y:quitar x ys

-- ? 6. quitarTodos
quitarTodos :: (Eq t) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos n (x:xs) | n == x = quitarTodos n xs
                     | otherwise = x : quitarTodos n xs

-- ! TESTS
-- ? 1 pertenece
testPertenece :: Test
testPertenece = test [
  "[]:" ~: pertenece "" [] ~=? False,
  "Azul pertenece:" ~: pertenece "azul" lista1 ~=? True,
  "Verde no pertenece:" ~: pertenece "verde" lista1 ~=? False,
  "Manzana pertenece:" ~: pertenece "manzana" lista2 ~=? True,
  "Limon no pertenece:" ~: pertenece "limon" lista2 ~=? False
 ]

 -- ? 2 todosIguales
testTodosIguales :: Test
testTodosIguales = test [
  "Caso lista1" ~: todosIguales lista1 ~=? False,
  "Caso lista2" ~: todosIguales lista2 ~=? False,
  "Caso lista3" ~: todosIguales lista3 ~=? True
 ]

-- ? todosDistintos
testTodosDistintos :: Test
testTodosDistintos = test [
  "Caso lista1" ~: todosDistintos lista1 ~=? True,
  "Caso lista2" ~: todosDistintos lista2 ~=? True,
  "Caso lista3" ~: todosDistintos lista3 ~=? False
 ]

-- ? hayRepetidos
testHayRepetidos :: Test
testHayRepetidos = test [
  "Caso lista1" ~: hayRepetidos lista1 ~=? False,
  "Caso lista2" ~: hayRepetidos lista2 ~=? False,
  "Caso lista3" ~: hayRepetidos lista3 ~=? True
 ]

tests :: Test
tests = TestList [
  TestLabel "testPertenece" testPertenece,
  TestLabel "testTodosIguales" testTodosIguales,
  TestLabel "testTodosDistintos" testTodosDistintos,
  TestLabel "testHayRepetidos" testHayRepetidos
 ]

correrTest = runTestTT tests