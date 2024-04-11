{-
Ejercicio 1.
a) Implentar la funci´on parcial f :: Integer->Integer definida por extensi´on de la siguiente manera:
f(1) = 8
f(4) = 131
f(16) = 16
cuya especificaci´on es la siguiente:
problema f (n: Z) : Z {
  requiere: {n = 1∨n = 4∨n=16}
  asegura: {(n = 1 → result = 8)∧(n = 4 → result = 131)∧(n = 16 → result = 16)}
  }

-}
functionF :: Int -> Int
functionF n | n == 1 = 8
           | n == 4 = 131
           | n == 16 = 16
           | otherwise = 0

{-
b) An´alogamente, especificar e implementar la funci´on parcial g :: Integer->Integer
g(8) = 16
g(16) = 4
g(131) = 1
-}
functionG :: Int -> Int
functionG n | n == 8 = 16
           | n == 16 = 4
           | n == 131= 1
           | otherwise = 0

{-
c) A partir de las functiones definidas en los ´ıtem 1 y 2, implementar las functiones parciales
h = f ◦ g y
k = g ◦f
-}

functionH :: Int -> Int
-- functionH = functionF.functionG
functionH n = functionF (functionG n)

functionK :: Int -> Int
-- functionK = functionG.functionF
functionK n = functionG (functionF n)