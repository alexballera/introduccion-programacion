{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
{-# HLINT ignore "Use map" #-}
import Test.HUnit
lista1 :: [String]
lista1 = ["azul", "rojo", "amarillo", "naranja", "marron"]
lista2 :: [String]
lista2 = ["manzana", "pera", "mango", "coco"]

-- ! Ejercicio 3. Definir las siguientes funciones sobre listas de enteros:

-- ? 3 maximo
{-
? Definir las siguientes funciones sobre listas de enteros

problema maximo (s: seq⟨Z⟩) : Z {
  requiere: { |s| > 0 }
  asegura: { resultado ∈ s ∧ todo elemento de s es menor o
  igual a resultado}
}
-}

maximo :: [Int] -> Int
maximo [x] = x
maximo (x:y:ys)
 | x > y = maximo (x:ys)
 | otherwise = maximo (y:ys)

maximoB :: [Int] -> Int
maximoB [x] = x
maximoB (x:xs)
 | x > head xs = maximoB (x:tail xs)
 | otherwise = maximoB xs


-- ! TESTS
-- ? 2.1 pertenece
{- testPertenece :: Test
testPertenece = test [
 ]
tests :: Test
tests = TestList [
  TestLabel "testPertenece" testPertenece
 ] -}