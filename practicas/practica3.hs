{-
! *****************************************************************
-- ! Ejercicio 1.
! *****************************************************************
-}

{-
? a) Implentar la funcion parcial f :: Integer->Integer definida por extension de la siguiente manera:
? f(1) = 8
? f(4) = 131
? f(16) = 16
? cuya especificacion es la siguiente:
problema f (n: Z) : Z {
  requiere: {n = 1 ∨ n = 4 ∨ n = 16}
  asegura: {(n = 1 → result = 8) ∧ (n = 4 → result = 131) ∧ (n = 16 → result = 16)}
  }

-}
f :: Integer -> Integer
f n | n == 1 = 8
    | n == 4 = 131
    | n == 16 = 16
    | otherwise = 0

{-
? b) Analogamente, especificar e implementar la funcion parcial g :: Integer->Integer
? g(8) = 16
? g(16) = 4
? g(131) = 1
-}
g :: Integer -> Integer
g n | n == 8 = 16
    | n == 16 = 4
    | n == 131= 1
    | otherwise = 0

{-
? c) A partir de las functiones definidas en los ıtem 1 y 2, implementar las functiones parciales
? h = f ◦ g y
? k = g ◦f
-}

h :: Integer -> Integer
h n = f (g n)
-- h = f.g

k :: Integer -> Integer
-- k n = functionG (functionF n)
k = g.f

{-
! *****************************************************************
! Ejercicio 2.⋆ Especificar e implementar las siguientes funciones,
! incluyendo su signatura.
! *****************************************************************
-}
{- 
? a) absoluto: calcula el valor absoluto de un numero entero.

problema f (n: Z): Z {
  requiere: {n: Z}
  asegura: {result = |n|}
  }
-}
absoluto :: Int -> Int
absoluto n | n < 0 = -n
           | otherwise = n
-- absoluto = abs

{-
? b) maximoabsoluto: devuelve el maximo entre el valor absoluto de dos numeros enteros.

problema f (n: Z, m: Z): Z {
  requiere: {n: Z, m: Z}
  asegura: {|n| > |m| result = |n| || result = |m|}
  }
-}

maximoAbsoluto :: (Int, Int) -> Int
maximoAbsoluto (n, m) | absoluto n > absoluto m = absoluto n
                      | otherwise = absoluto m

{-
? c) maximo3: devuelve el maximo entre tres numeros enteros.

problema f (n: Z, m: Z, p: Z): Z {
  requiere: {n: Z, m: Z}
  asegura: {((n > m) ∧ (n > p) -> result = n) ∨ (m > p -> result = m) ∨  (result = p)}
  }
-}
maximo3 :: (Int, Int, Int) -> Int
maximo3 (n, m, p) | n > m && n > p = n
                  | m > p = m
                  | otherwise = p

{-
?d) algunoEs0: dados dos numeros racionales, decide si alguno de los dos es igual a 0
?  (hacerlo dos veces, una usando pattern matching y otra no).

problema f (n: Z, m: Z): Bool {
  requiere: {n: Z, m: Z}
  asegura: {(n == 0) ∨ (m == 0) -> result = True}
  }
-}

algunoEs0 :: (Int, Int) -> Bool
-- functionEs0 (m, n) = (n == 0) || (m == 0)

-- pattern matching:
algunoEs0 (_, 0) = True
algunoEs0 (0, _) = True
algunoEs0 (_, _) = False

{-
? e) ambosSon0: dados dos numeros racionales, decide si ambos son iguales a 0
?  (hacerlo dos veces, una usando pattern matching y otra no).

problema f (n: Z, m: Z): Bool {
  requiere: {n: Z, m: Z}
  asegura: {(n == 0) ∧ (m == 0) -> result = True}
  }
-}

ambosSon0 :: (Int, Int) -> Bool
ambosSon0 (n , m) | (n == 0) && (m == 0) = True
                  | otherwise = False
-- pattern matching:
{- ambosSon0 (0, 0) = True
ambosSon0 (_, _) = False -}

{-
? f) mismoIntervalo: dados dos numeros reales,
? indica si estan relacionados considerando la
? relacion de equivalencia en R cuyas clases de
? equivalencia son: (−∞,3],(3,7] y (7,∞), o dicho
? de otra forma, si pertenecen al mismo intervalo.

problema f (n: R, m: R): Bool {
  requiere: {n, m números reales R}
  asegura: {resultado Verdadero o Falso si m y n
  pertenecen a cualquiera de los intervalos
  (−∞,3],(3,7] y (7,∞)}
  }
-}

mismoIntervalo :: (Float, Float) -> String
-- Preguntar por los caracteres especiales como ∞ y acentos
mismoIntervalo (m, n) | (m <= 3) && (n <= 3) = "Pertenecen a (-Inf,3]"
                      | ((3 < m) && (m <= 7)) && ((3 < n )&& (n <= 7)) = "Pertenecen a (3,7]"
                      | (m > 7) && (n > 7) = "Pertenecen (7,Inf)"
                      | otherwise = "No pertenecen al mismo tiempo a ningun intervalo"

{-
? g) sumaDistintos: que dados tres numeros enteros calcule la suma sin sumar repetidos (si los hubiera).

problema f (n: Z, m: Z, p: Z): Z {
  requiere: {n: Z, m: Z, p: Z}
  asegura: {Sumar tres números n, m y/o p que no sean repetidos}
  }
-}

sumaDistintos :: (Int, Int, Int) -> Int
sumaDistintos (n, m, p) | (n /= m) && (n /= p) && (m /= p) = m + n + p
                        | (n == m) && (n /= p) = m + p
                        | (n == p) && (n /= m) = n + m
                        | (m == p) && (n /= p) = n + p
                        | otherwise = m

{-
? h) esMultiploDe: dados dos numeros naturales, decidir si el primero es multiplo del segundo.

problema f (n: N, m: N): Bool {
  requiere: {n: N, m: N}
  asegura: {n/p = p, p: N -> result = True}
  }
-}

esMultiploDe :: (Integer, Integer) -> Bool
esMultiploDe (n, m) = n `mod` m == 0

{-
? i) digitoUnidades: dado un numero entero, extrae su dıgito de las unidades.

problema f (n: Z): Z {
  requiere: {n: Z}
  asegura: {Extraer su dıgito de las unidades}
  }
-}

digitoUnidades :: Int -> Int
digitoUnidades x = mod (abs x) 10

{-
? j) digitoDecenas: dado un numero entero, extrae su dıgito de las decenas. 

problema f (n: Z): Z {
  requiere: {n: Z}
  asegura: {Extraer su dıgito de las decenas}
  }
-}

digitoDecenas :: Int -> Int
digitoDecenas x = mod (abs x `div` 10) 10

{-
! *****************************************************************
! Ejercicio 3.⋆ Especificar e implementar las siguientes funciones,
! incluyendo su signatura.
! *****************************************************************
-}