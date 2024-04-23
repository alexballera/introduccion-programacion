{-
! Ejercicio 1.

? Implementar la función fibonacci:: Integer->Integer que devuelve el i-ésimo número de Fibonacci.
? Recordar que la secuencia de Fibonacci se define como:

            0 si n = 0
fib(n) =    1 si n = 1
            fib(n −1) + fib(n−2) en otro caso

problema fibonacci (n: Z) : Z {
  requiere: { n ≥ 0 }
  asegura: { resultado = fib(n) }
}
-}

fibonacci :: Int -> Int
-- fibonacci n | n == 0 || n == 1 = n
--             | otherwise = fibonacci (n - 1) + fibonacci (n - 2)

-- Pattern Machine
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

{-
! Ejercicio 2.

? Implementar una función parteEntera :: Float -> Integer
? según la siguiente especificación:
problema parteEntera (x: R) : Z {
  requiere: { True } 
  asegura: { resultado ≤ x < resultado+1 }
}
-}

entero :: Float -> Integer
entero = truncate

parteEntera :: Float -> Integer
parteEntera x | 0 <= x && x < 1 = 0
               | x > 1 = 1 + parteEntera (x - 1)
               | x < 0 = (-1) + parteEntera (x + 1)

{-
! Ejercicio 3.

? Especificar e implementar la función esDivisible :: Integer -> Integer -> Bool
? que dados dos números naturales determinar si el primero es divisible por el segundo.
? No está permitido utilizar las funciones mod ni div

problema esDivisible (m: Z, n: Z) : Z {
  requiere: { True }
  asegura: { Si m es divisible por n, resultado: True }
}
-}

esDivisible :: Integer -> Integer -> Bool
esDivisible m n | m < n = False
                | m == n = True
                | m > n = esDivisible (m - n) n

{-
! Ejercicio 4.
? Especificar e implementar la función sumaImpares :: Integer -> Integer
? que dado n ∈ N sume los primeros n números impares.
? Por ejemplo: sumaImpares 3 ❀ 1+3+5 ⇝ 9.

problema sumaImpares (n: N) : N {
  requiere: { n ∈ N }
  asegura: { Sume los primeros n números impares, m = 1 + 3 + ... , resultado: m }
}
-}

sumaImpares :: Int -> Int
sumaImpares 0 = 0
sumaImpares 1 = 1
sumaImpares n = sumaImpares (n - 1) + (2*n - 1)

{-
! Ejercicio 5.
? Implementar la función medioFact :: Integer -> Integer que dado n ∈ N calcula n!! = n(n−2)(n−4)···.
-}

medioFact :: Integer -> Integer
medioFact 0 = 1
medioFact 1 = 1
medioFact n = n*medioFact (n - 2)

{-
! Ejercicio 6.
? Especificar e implementar la función sumaDigitos :: Integer -> Integer que calcula la suma de
? dígitos de un número natural. Para esta función pueden utilizar div y mod
-}

muestraUltimoDigito :: Integer -> Integer
muestraUltimoDigito n = mod n 10

quitaUltimoDigito :: Integer -> Integer
quitaUltimoDigito n = div n 10

sumaDigitos :: Integer -> Integer
sumaDigitos n
 | n < 10 = n
 | otherwise = muestraUltimoDigito n + sumaDigitos (quitaUltimoDigito n)
{-
! Ejercicio 7.
? Implementar la función todosDigitosIguales :: Integer -> Bool
? que determina si todos los dígitos de un número natural son iguales, es decir:

problema todosDigitosIguales (n: Z) : B {
  requiere: { n > 0 }
  asegura: { resultado = true ↔ todos los dígitos de n son iguales }
}
-}

todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
 | n < 10 = True
 | otherwise = (muestraUltimoDigito n == muestraUltimoDigito (quitaUltimoDigito n)) && todosDigitosIguales (quitaUltimoDigito n)

{-
! Ejercicio 8.
? Implementar la función iesimoDigito :: Integer -> Integer -> Integer
? que dado un n 2 N 0 y un i 2 N menor o igual a la cantidad de dígitos de n,
? devuelve el i-ésimo dígito de n.
-}

iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i | i == cantidadDigitos n = mostrarUltimo n
                 | otherwise = mod (div n (10^(cantidadDigitos n - i))) 10 -- iesimoDigito (sacarUltimo n) i 
                 where mostrarUltimo n = mod n 10
                       sacarUltimo n = div n 10

cantidadDigitos :: Integer -> Integer
cantidadDigitos n | n < 10 = 1
                  | otherwise = 1 + cantidadDigitos (sacarUltimo n)
                   where sacarUltimo n = div n 10

{-
! Ejercicio 9.
? Especificar e implementar una función esCapicua :: Integer -> Bool
? que dado n E N >= 0 determina si n es un número capicúa.

problema esCapicua (n: N): Bool {
  requiere: {n >= 0}
  asegura: { Sea n = abcd..., entonces abcd... = ...dcba, resultado = True }
}
-}

esCapicua :: Integer -> Bool
esCapicua n
 | cantidadDigitos n <= 1 = True
 | iesimoDigito n (cantidadDigitos n) /= iesimoDigito n 1 = False
 | otherwise = esCapicua (quitaExtremos n)
 where quitaExtremos n = div (mod n (10^(cantidadDigitos n - 1))) 10 -- al n de entrada le saca los extremos ej: 9876789 -> 87678

{-
! Ejercicio 10.
? Especificar, implementar y dar el tipo de las siguientes funciones
-}

f1 :: Integer -> Integer
f1 0 = 1
f1 n | n > 0 = 2^(n + 1) - 1

f2 :: Integer -> Float -> Float
f2 1 q = q
f2 n q = f2 (n - 1) q + q^n

f3 :: Integer -> Float -> Float
f3 n = f2 (2 * n)

f4 :: Integer -> Float -> Float
-- f4 n q = f3 n q - f2 n q
f4 n q = f2 (2*n) q - f2 n q

{-
! Ejercicio 11.
? Especificar e implementar una función eAprox :: Integer -> Float
? que aproxime el valor del número e
-}
eAprox :: Integer -> Float
eAprox 0 = 1
eAprox 1 = 2
eAprox n
  = eAprox (n - 1) + 1/factorial n
 where factorial 0 = 1
       factorial 1 = 1
       factorial n = factorial(n - 1)* fromIntegral n

e :: Float
e = eAprox 10

{-
! Ejercicio 12.
-}

f :: Integer -> Float
f 1 = 2
f n = 2 + 1/f (n - 1)

raizDe2Aprox n = f n - 1

{-
! Ejercicio 13.
? Especificar e implementar la siguiente función:

problema sumatoria (n: Z, m: Z) : Z {
  requiere: { n > 0 }
  asegura: { resultado = sumatoria }
}
-}

sumatoriaInterna :: Int -> Int -> Int
sumatoriaInterna 0 _ = 0
sumatoriaInterna m i = sumatoriaInterna (m - 1) i + i^m

sumatoria :: Int -> Int -> Int
sumatoria 0 _ = 0
sumatoria n m = sumatoria (n - 1) m + sumatoriaInterna n m

{-
! Ejercicio 14.
? Especificar e implementar una función
? sumaPotencias :: Integer -> Integer -> Integer -> Integer
? que dados tres naturales q; n; m sume todas las potencias
? de la forma q^a+b con 1 <= a <= n y 1 <= b <= m.

problema sumatoria (n: Z, m: Z) : Z {
  requiere: { n > 0 }
  asegura: { resultado = sumatoria }
}
-}

sumaPotenciasInterna :: Integer -> Integer -> Integer
sumaPotenciasInterna q 0 = 0
sumaPotenciasInterna q m = q^m + sumaPotenciasInterna q (m - 1)

sumaPotencias :: Integer -> Integer -> Integer -> Integer
sumaPotencias 0 _ _ = 0
sumaPotencias q m n = sumaPotenciasInterna q m * sumaPotenciasInterna q n
