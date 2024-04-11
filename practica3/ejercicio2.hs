-- ⋆ Especificar e implementar las siguientes funciones, incluyendo su signatura.
{-
a) absoluto: calcula el valor absoluto de un numero entero.

problema f (n: Z): Z {
  requiere: {n: Z}
  asegura: {result = |n|}
  }
-}
functionAbsoluto :: Int -> Int
functionAbsoluto n | n < 0 = -n
                   | otherwise = n
-- functionAbsoluto = abs

{-
b) maximoabsoluto: devuelve el maximo entre el valor absoluto de dos numeros enteros.

problema f (n: Z, m: Z): Z {
  requiere: {n: Z, m: Z}
  asegura: {|n| > |m| result = |n| || result = |m|}
  }
-}

functionMaximoAbsoluto :: (Int, Int) -> Int
functionMaximoAbsoluto (n, m) | functionAbsoluto n > functionAbsoluto m = functionAbsoluto n
                              | otherwise = functionAbsoluto m

{-
c) maximo3: devuelve el maximo entre tres numeros enteros.

problema f (n: Z, m: Z, p: Z): Z {
  requiere: {n: Z, m: Z}
  asegura: {((n > m) ∧ (n > p) -> result = n) ∨ (m > p -> result = m) ∨  (result = p)}
  }
-}
functionMaximo3 :: (Int, Int, Int) -> Int
functionMaximo3 (n, m, p) | n > m && n > p = n
                          | m > p = m
                          | otherwise = p

{-
d) algunoEs0: dados dos numeros racionales, decide si alguno de los dos es igual a 0
  (hacerlo dos veces, una usando pattern matching y otra no).

problema f (n: Z, m: Z): Bool {
  requiere: {n: Z, m: Z}
  asegura: {(n == 0) ∨ (m == 0) -> result = True}
  }
-}

functionAlgunoEs0 :: (Int, Int) -> Bool
-- functionEs0 (m, n) = (n == 0) || (m == 0)

-- pattern matching:
functionAlgunoEs0 (_, 0) = True
functionAlgunoEs0 (0, _) = True
functionAlgunoEs0 (_, _) = False

{-
e) ambosSon0: dados dos numeros racionales, decide si ambos son iguales a 0
  (hacerlo dos veces, una usando pattern matching y otra no).

problema f (n: Z, m: Z): Bool {
  requiere: {n: Z, m: Z}
  asegura: {(n == 0) ∧ (m == 0) -> result = True}
  }
-}

functionAmbosCero :: (Int, Int) -> Bool
functionAmbosCero (n , m) | (n == 0) && (m == 0) = True
                          | otherwise = False
-- pattern matching:
{- functionAmbosCero (0, 0) = True
functionAmbosCero (_, _) = False -}

{-
f) mismoIntervalo: dados dos numeros reales,
indica si estan relacionados considerando la
relacion de equivalencia en R cuyas clases de
equivalencia son: (−∞,3],(3,7] y (7,∞), o dicho
de otra forma, si pertenecen al mismo intervalo.

problema f (n: R, m: R): Bool {
  requiere: {n, m números reales R}
  asegura: {resultado Verdadero o Falso si m y n
  pertenecen a cualquiera de los intervalos
  (−∞,3],(3,7] y (7,∞)}
  }
-}

functionMismoIntertvalo :: (Float, Float) -> String
-- Preguntar por los caracteres especiales como ∞ y acentos
functionMismoIntertvalo (m, n) | (m <= 3) && (n <= 3) = "Pertenecen a (-Inf,3]"
                               | ((3 < m) && (m <= 7)) && ((3 < n )&& (n <= 7)) = "Pertenecen a (3,7]"
                               | (m > 7) && (n > 7) = "Pertenecen (7,Inf)"
                               | otherwise = "No pertenecen al mismo tiempo a ningun intervalo"

{-
g) sumaDistintos: que dados tres numeros enteros calcule la suma sin sumar repetidos (si los hubiera).

problema f (n: Z, m: Z, p: Z): Z {
  requiere: {n: Z, m: Z, p: Z}
  asegura: {Sumar tres números n, m y/o p que no sean repetidos}
  }
-}

functionSumaDistintos :: (Int, Int, Int) -> Int
functionSumaDistintos (n, m, p) | (n /= m) && (n /= p) && (m /= p) = m + n + p
                                | (n == m) && (n /= p) = m + p
                                | (n == p) && (n /= m) = n + m
                                | (m == p) && (n /= p) = n + p
                                | otherwise = m

{-
h) esMultiploDe: dados dos numeros naturales, decidir si el primero es multiplo del segundo.

problema f (n: N, m: N): Bool {
  requiere: {n: N, m: N}
  asegura: {n/p = p, p: N -> result = True}
  }
-}

functionEsMultiploDe :: (Integer, Integer) -> Bool
functionEsMultiploDe (n, m) = n `mod` m == 0

{-
i) digitoUnidades: dado un numero entero, extrae su dıgito de las unidades.

problema f (n: Z): Z {
  requiere: {n: Z}
  asegura: {Extraer su dıgito de las unidades}
  }
-}

functionDigitoUnidades :: Int -> Int
functionDigitoUnidades x = mod (abs x) 10

{-
j) digitoDecenas: dado un numero entero, extrae su dıgito de las decenas. 

problema f (n: Z): Z {
  requiere: {n: Z}
  asegura: {Extraer su dıgito de las decenas}
  }
-}

functionDigitoDecenas :: Int -> Int
functionDigitoDecenas x = mod (abs x `div` 10) 10

