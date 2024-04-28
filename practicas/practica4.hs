{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use even" #-}
{-# HLINT ignore "Use odd" #-}
module Practica4 where
{-
! Ejercicio 1.

? Implementar la función fibonacci:: Integer -> Integer que devuelve el i-ésimo número de Fibonacci.
? Recordar que la secuencia de Fibonacci se define como:

            0 si n = 0
fib(n) =    1 si n = 1
            fib(n −1) + fib(n−2) en otro caso

problema fibonacci (n: Z) : Z {
  requiere: { n ≥ 0 }
  asegura: { resultado = fib(n) }
}
-}

fibonacci :: Integer -> Integer
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

parteEntera :: Float -> Integer
parteEntera n | 0 <= n && n < 1 = 0
               | n >= 1 = 1 + parteEntera (n - 1)
               | otherwise = (-1) + parteEntera (n + 1)

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
       factorial n = factorial (n - 1)* fromIntegral n

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

{-
! Ejercicio 15.
? Especificar e implementar una función sumaRacionales :: Integer -> Integer -> Float
? que dados dos naturales n;m sume todos los números racionales de la forma p/q con 1 <= p <= n
? y 1 <= q <= m, es decir:
-}
sumaRacionalesAux :: Integer -> Integer -> Float
sumaRacionalesAux _ 0 = 0
sumaRacionalesAux n m = fromIntegral n / fromIntegral m + sumaRacionalesAux n (m - 1)

sumaRacionales :: Integer -> Integer -> Float
sumaRacionales 0 _ = 0
sumaRacionales n m = sumaRacionalesAux n m + sumaRacionales (n - 1) m

-- ! Esjercicio 16
{-
? a) Implementar menorDivisor :: Integer ->Integer
? que calcule el menor divisor (mayor que 1) de un natural n pasado como parámetro.
-}

menorDivisor :: Integer -> Integer
menorDivisor n = menorDivisorAux n 2
                where menorDivisorAux n d
                        | mod n d == 0 = d
                        | otherwise = menorDivisorAux n (d + 1)

{-
? b) Implementar la función esPrimo :: Integer -> Bool
? que indica si un número natural pasado como parámetro es primo.
-}

esPrimo :: Integer -> Bool
esPrimo n = menorDivisor n == n

{-
? c)  Implementar la función sonCoprimos :: Integer -> Integer -> Bool
? que dados dos números naturales indica si no tienen algún divisor
? en común mayor estricto que 1.
-}

sonCoprimos :: Integer -> Integer -> Bool
sonCoprimos n m = menorDivisor n /= menorDivisor m

{-
? d) Implementar la función nEsimoPrimo :: Integer -> Integer
? que devuelve el nésimo primo (n >= 1). Recordar que el
? primer primo es el 2, el segundo es el 3, el tercero es el 5, etc.
-}

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo 1 = 2
nEsimoPrimo n = proxPrimo (nEsimoPrimo (n - 1))
              where proxPrimo n | esPrimo (n + 1) = n + 1
                                | otherwise  = proxPrimo (n + 1)

{-
! Ejercicio 17.
? Implementar la función esFibonacci :: Integer -> Bool
? según la siguiente especificación:

problema esFibonacci (n: Z) : B {
 requiere: { n >= 0 }
 asegura: { resultado = true $ n es algún valor de la secuencia de Fibonacci definida en el ejercicio 1 }
}
-}
esFibonacci :: Integer -> Bool
esFibonacci n = pasoRecursivo n 0
              where pasoRecursivo n i | fibonacci i == n = True
                                      | fibonacci i > n = False
                                      | otherwise = pasoRecursivo n (i + 1)

 {-
! Ejercicio 18.
? Implementar una función mayorDigitoPar :: Integer -> Integer
? según la siguiente especificación:

problema mayorDigitoPar (n: N) : N {
  requiere: { True }
  asegura: { resultado es el mayor de los dígitos pares de n. Si n no tiene ningún dígito par, entonces resultado es -1.
}

 -}
mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n
 | casoBase1 = n
 | casoBase2 = -1
 | esPar = maximo
 | otherwise = recursivo
 where casoBase1 = n < 10 && esPar
       casoBase2 = n < 10
       esPar = mod n 2 == 0
       ultimo n = mod n 10
       quitaUltimo = div n 10
       recursivo = mayorDigitoPar quitaUltimo
       maximo | mod n 10 > mayorDigitoPar quitaUltimo = mod n 10
              | otherwise = mayorDigitoPar quitaUltimo

{-
! Ejercicio 19.
? Implementar la funición esSumaInicialDePrimos :: Int -> Bool
? según la siguiente especificación:

problema esSumaInicialDePrimos (n: Z) : B f
  requiere: { n >= 0 }
  asegura: { resultado = true <-> n es igual a la suma de los m primeros números primos, para algún m.}

-}
esSumaInicialDePrimos :: Int -> Bool
esSumaInicialDePrimos 0 = False
esSumaInicialDePrimos n = n == sumaDePrimerosPrimos n
                        where  sumaDePrimerosPrimos n | n == 1 = 0
                                                      | esNumPrimo (n - 1) = n - 1 + sumaDePrimerosPrimos (n - 1)
                                                      | otherwise = sumaDePrimerosPrimos (n - 1)
                               esNumPrimo n = noTieneDivisores n 2
                               noTieneDivisores n i | n == i || i == 1 = True
                                                    | n == 1 || mod n i == 0 = False
                                                    | otherwise = noTieneDivisores n (i + 1)

{-
! Ejercicio 21.
? Especificar e implementar una funcióon pitagoras :: Integer -> Integer -> Integer -> Integer
? que dados m, n , r E N>=0, cuente cuántos pares (p; q) con 0 <= p <= m y 0 <= q <= n satisfacen que p2 + q2 <= r2. Por ejemplo:
pitagoras 3 4 5   20
pitagoras 3 4 2   6
-}
esMenorPitagoriano :: Integer->Integer->Integer->Bool
esMenorPitagoriano p q r = p^2 + q^2 <= r^2

pitagorasNFijo :: Integer -> Integer -> Integer -> Integer
pitagorasNFijo n m r | m < 0 = 0
                     | esMenorPitagoriano n m r = 1 + pitagorasNFijo n (m - 1) r
                     | otherwise = pitagorasNFijo n (m - 1) r

pitagoras :: Integer -> Integer -> Integer -> Integer
pitagoras n m r | n == 0 = pitagorasNFijo 0 m r
                | otherwise = pitagorasNFijo n m r + pitagoras (n - 1) m r


