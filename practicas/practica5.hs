import Test.HUnit
{-
! Ejercicio 2.1

? Implementar pertenece :: (Eq t) => t -> [t] -> Bool
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

testPertenece :: Test
lista1 = ["azul", "rojo", "amarillo", "naranja"]
lista2 = ["manzana", "pera", "mango", "coco"]
testPertenece = test [
  "[]:" ~: pertenece "" [] ~=? False,
  "Azul pertenece:" ~: pertenece "azul" lista1 ~=? True,
  "Verde no pertenece:" ~: pertenece "verde" lista1 ~=? False,
  "Manzana pertenece:" ~: pertenece "manzana" lista2 ~=? False,
  "Limon no pertenece:" ~: pertenece "limon" lista2 ~=? False
 ]

{-
! Ejercicio 2.4
? Definir la siguiente función sobre listas:
? hayRepetidos :: (Eq t) => [t] -> Bool
problema hayRepetidos (s: seq⟨T ⟩) : B {
  requiere: { T rue }
  asegura: { resultado = true ↔ existen dos posiciones
  distintas de s con igual valor }
}
Sugerencia: Utilizar la funci´on pertenece del ej 2.1
}
-}

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = pertenece x xs || hayRepetidos xs

{-
! Ejercicio 2.5
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

{-
! Ejercicio 3.3
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


-- TESTS
tests :: Test
tests = TestList [
  TestLabel "testPertenece" testPertenece
 ]

correrTest :: IO Counts
correrTest = runTestTT tests