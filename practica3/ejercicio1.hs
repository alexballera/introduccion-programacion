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
funcionF :: Int -> Int
funcionF f | f == 1 = 8
           | f == 4 = 131
           | f == 16 = 16

{-
b) An´alogamente, especificar e implementar la funci´on parcial g :: Integer->Integer
g(8) = 16
g(16) = 4
g(131) = 1
-}
funcionG :: Int -> Int
funcionG g | g == 8 = 16
           | g == 16 = 4
           | g == 131= 1

{-
c) A partir de las funciones definidas en los ´ıtem 1 y 2, implementar las funciones parciales
h = f ◦ g y
k = g ◦f
-}

funcionH :: Int -> Int
funcionK = funcionF.funcionG

funcionK :: Int -> Int
funcionH = funcionG.funcionF