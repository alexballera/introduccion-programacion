{-
Ejercicio 1.
a) Implentar la funcion parcial f :: Integer->Integer definida por extension de la siguiente manera:
f(1) = 8
f(4) = 131
f(16) = 16
cuya especificacion es la siguiente:
problema f (n: Z) : Z {
  requiere: {n = 1 ∨ n = 4 ∨ n = 16}
  asegura: {(n = 1 → result = 8) ∧ (n = 4 → result = 131) ∧ (n = 16 → result = 16)}
  }

-}
functionF :: Integer -> Integer
functionF n | n == 1 = 8
            | n == 4 = 131
            | n == 16 = 16
            | otherwise = 0

{-
b) Analogamente, especificar e implementar la funcion parcial g :: Integer->Integer
g(8) = 16
g(16) = 4
g(131) = 1
-}
functionG :: Integer -> Integer
functionG n | n == 8 = 16
            | n == 16 = 4
            | n == 131= 1
            | otherwise = 0

{-
c) A partir de las functiones definidas en los ıtem 1 y 2, implementar las functiones parciales
h = f ◦ g y
k = g ◦f
-}

functionH :: Integer -> Integer
functionH n = functionF (functionG n)
-- functionH = functionF.functionG

functionK :: Integer -> Integer
-- functionK n = functionG (functionF n)
functionK = functionG.functionF