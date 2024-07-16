{-
! *****************************************************************
! Ejercicio 1.
! *****************************************************************

? a) Implentar la funcion parcial f :: Integer->Integer definida
? por extension de la siguiente manera:
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
f n
  | n == 1 = 8
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
g n
  | n == 8 = 16
  | n == 16 = 4
  | n == 131 = 1
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
-- k n = g (f n)
k = g . f

{-
! *****************************************************************
! Ejercicio 2.
! *****************************************************************

? Especificar e implementar las siguientes funciones,
? incluyendo su signatura.

? a) absoluto: calcula el valor absoluto de un numero entero.

problema f (n: Z): Z {
  requiere: {n: Z}
  asegura: {result = |n|}
  }
-}
absoluto :: Int -> Int
absoluto n
  | n < 0 = -n
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
maximoAbsoluto (n, m)
  | absoluto n > absoluto m = absoluto n
  | otherwise = absoluto m

{-
? c) maximo3: devuelve el maximo entre tres numeros enteros.

problema f (n: Z, m: Z, p: Z): Z {
  requiere: {n: Z, m: Z}
  asegura: {((n > m) ∧ (n > p) -> result = n) ∨ (m > p -> result = m) ∨  (result = p)}
  }
-}
maximo3 :: (Int, Int, Int) -> Int
maximo3 (n, m, p)
  | n > m && n > p = n
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
ambosSon0 (n, m)
  | (n == 0) && (m == 0) = True
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
mismoIntervalo (m, n)
  | (m <= 3) && (n <= 3) = "Pertenecen a (-Inf,3]"
  | ((3 < m) && (m <= 7)) && ((3 < n) && (n <= 7)) = "Pertenecen a (3,7]"
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
sumaDistintos (n, m, p)
  | (n /= m) && (n /= p) && (m /= p) = m + n + p
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

esMultiploDe :: (Int, Int) -> Bool
esMultiploDe (n, m) = mod n m == 0

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
! Ejercicio 3.
! *****************************************************************

? Implementar una funcion estanRelacionados :: Integer -> Integer -> Bool

problema estanRelacionados (a:Z, b:Z) : Bool {
  requiere: {a= 0∧b= 0}
  asegura: {(res = true) ↔ a∗a+a∗b∗k = 0 para algun k ∈ Z con k= 0)}
  }
  Por ejemplo:
  estanRelacionados 8 2 ⇝ True porque existe un k = −4 tal que 82 +8×2×(−4) = 0.
  estanRelacionados 7 3 ⇝ False porque no existe un k entero tal que 72 +7×3×k = 0.
-}
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados a b = mod a b == 0

{-
! *****************************************************************
! Ejercicio 4.
! *****************************************************************

? Especificar e implementar las siguientes funciones
? utilizando tuplas para representar pares, ternas de numeros.

? a) prodInt: calcula el producto interno entre dos tuplas R × R.

problema prodInt (a:R, b:R) -> (c: R, d: R): (e: R, f: R) {
  requiere: {a, b, c, d E R}
  asegura: {Resultado de la suma del producto interno entre dos tuplas R × R}
  }
-}

prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (a, b) (c, d) = a * (c + d) + b * (c + d)

{-
? b) todoMenor: dadas dos tuplas R×R, decide si es cierto que cada coordenada
? de la primera tupla es menor a la coordenada correspondiente de la segunda tupla.
-}

{-
problema todoMenor (a:R, b:R) -> (c: R, d: R): (e: R, f: R) {
  requiere: {a, b, c, d E R}
  asegura: {(a < c) ∧ (b < d) -> result = True }
  }
-}

todoMenor :: (Int, Int) -> (Int, Int) -> Bool
todoMenor (a, b) (c, d) = (a < c) && (b < d)

-- ? c) distanciaPuntos: calcula la distancia entre dos puntos de R2

{-
problema distanciaPuntos (a:R, b:R) -> (c: R, d: R): (e: R, f: R) {
  requiere: {a, b, c, d E R}
  asegura: {√(a - c)²+(b - d)² -> result = R }
  }
-}

distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (a, b) (c, d) = sqrt ((a - c) ** 2 + (b - d) ** 2)

-- ? sumaTerna: dada una terna de enteros, calcula la suma de sus tres elementos.

{-
problema sumaTerna (a: R, b: R, c: R): R {
  requiere: {a, b, c, E R}
  asegura: {Suma de sus tres elementos-> result = R }
  }
-}

sumaTerna :: (Float, Float, Float) -> Float
sumaTerna (a, b, c) = a + b + c

{-
? e) sumarSoloMultiplos: dada una terna de numeros enteros y un natural,
? calcula la suma de los elementos de la terna que son multiplos del numero
? natural. Por ejemplo:
? sumarSoloMultiplos (10,-8,-5) 2 ⇝ 2
? sumarSoloMultiplos (66,21,4) 5 ⇝ 0
? sumarSoloMultiplos (-30,2,12) 3 ⇝-18

problema sumarSoloMultiplos (a: Z, b: Z, c: Z) -> n: N: Z {
  require: {a, b, c E Z; n E N}
  asegura: {Suma de los elementos de la terna que sean multiplos de n -> result = Z}
}
-}

sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (a, b, c) n = esMultiplo (a, n) + esMultiplo (b, n) + esMultiplo (c, n)

esMultiplo :: (Int, Int) -> Int
esMultiplo (x, n)
  | esMultiploDe (x, n) = x
  | otherwise = 0

{-
? g) crearPar :: a->b->(a, b):
? crea un par a partir de sus dos componentes dadas por separado
? (debe funcionar para elementos de cualquier tipo)

  problema crearPar a -> b -> (a, b)  {
    require: {a, b, E Z;}
    asegura: {Dupla a partir de sus dos componentes -> result = (a ,b)}
  }
-}
crearPar :: a -> b -> (a, b)
crearPar a b = (a, b)

{-
? h) invertir :: (a, b) -> (b, a): invierte los elementos del par
? pasado como parametro (debe funcionar para elementos de cualquier tipo)

  problema invertir (a, b) -> (b, a)  {
    require: {a, b, E Z;}
    asegura: {Invierte los elementos del par -> result = (b ,a)}
  }
-}

invertir :: (a, b) -> (b, a)
invertir (a, b) = (b, a)

{-
! *****************************************************************
! Ejercicio 5.
! *****************************************************************

? Implementar la funcion todosMenores :: (Integer, Integer, Integer)->Bool

  problema todosMenores (t : Z×Z×Z) : Bool {
    requiere: {True}
    asegura: {(res = true) ↔ ((f(t0) > g(t0)) ∧(f(t1) > g(t1)) ∧ (f(t2) > g(t2)))}
  }

  problema f (n: Z) : Z {
    requiere: {True}
    asegura: {(n ≤ 7 → res = n2)∧(n > 7 →res =2n−1)}
  }

  problema g (n: Z) : Z {
    requiere: {True}
    asegura: {Si n es un numero par, entonces res = n/2, en caso contrario, res = 3n+1}
  }
-}

todosMenores :: (Integer, Integer, Integer) -> Bool
f5 :: Integer -> Integer
g5 :: Integer -> Integer

f5 n
  | n <= 7 = 2 * n
  | otherwise = 2 * n - 1

g5 n
  | even n = div n 2
  | otherwise = 3 * n + 1

todosMenores (m, n, o) = (f m > g m) && (f n > g n) && (f o > g o)

{-
! *****************************************************************
! Ejercicio 6.
! *****************************************************************

? Programar una funcion bisiesto :: Integer -> Bool
? segun la siguiente especificacion:

problema bisiesto (año: Z) : Bool {
  requiere: {True}
  asegura: {res = false ↔ año no es multiplo de 4 o año es multiplo de 100 pero no de 400}
}

Por ejemplo:
bisiesto 1901 ⇝ False,
bisiesto 1900 ⇝ False,
bisiesto 1904 ⇝ True,
bisiesto 2000 ⇝ True.
-}

bisiesto :: Int -> Bool
bisiesto a = not (mod a 4 /= 0 || mod a 100 == 0 && mod a 400 /= 0)

{-
! *****************************************************************
! Ejercicio 7.
! *****************************************************************

? Implementar una funcion: distanciaManhattan:: (Float, Float, Float) -> (Float, Float, Float) -> Float

problema distanciaManhattan (p : R×R×R,q : R×R×R) : R {
  requiere: {True}
  asegura: {res = 2 i=0|pi −qi|}
  }
Por ejemplo:
distanciaManhattan (2, 3, 4) (7, 3, 8) ⇝ 9
distanciaManhattan ((-1), 0, (-8.5)) (3.3, 4, (-4)) ⇝ 12.8
-}

distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (x1, y1, z1) (x2, y2, z2) = abs (x1 - x2) + abs (y1 - y2) + abs (z1 - z2)

{-
! *****************************************************************
! Ejercicio 8.
! *****************************************************************

? Implementar una funcion comparar :: Integer -> Integer -> Integer

problema comparar (a:Z, b:Z) : Z {
  requiere: {True}
  asegura: {(res = 1 ↔ sumaUltimosDosDigitos(a) < sumaUltimosDosDigitos(b))}
  asegura: {(res = −1 ↔ sumaUltimosDosDigitos(a) > sumaUltimosDosDigitos(b))}
  asegura: {(res = 0 ↔ sumaUltimosDosDigitos(a) = sumaUltimosDosDigitos(b))}
}

problema sumaUltimosDosDigitos (x: Z) : Z {
  requiere: {True}
  asegura: {res = (|x| mod 10)+(⌊(|x|/10)⌋ mod 10)}
}

Por ejemplo:

comparar 45 312 ⇝-1 porque 45 ≺ 312 y 4+5>1+2.
comparar 2312 7 ⇝ 1 porque 2312 ≺ 7 y 1+2<0+7.
comparar 45 172 ⇝ 0 porque no vale 45 ≺ 172 ni tampoco 172 ≺ 45.
-}

comparar :: (Integer, Integer) -> Integer
sumaUltimoDosDigitos :: Integer -> Integer
sumaUltimoDosDigitos x = (abs x `mod` 10) + (abs x `div` 10 `mod` 10)
comparar (a, b)
  | sumaUltimoDosDigitos a < sumaUltimoDosDigitos b = 1
  | sumaUltimoDosDigitos a > sumaUltimoDosDigitos b = -1
  | otherwise = 0