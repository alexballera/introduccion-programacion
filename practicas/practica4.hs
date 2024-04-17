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
                | m > n = esDivisible (m - n) n

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

{-
! Ejercicio 7.
? Implementar la función todosDigitosIguales :: Integer -> Bool
? que determina si todos los dígitos de un número natural son iguales, es decir:

problema todosDigitosIguales (n: Z) : B {
  requiere: { n > 0 }
  asegura: { resultado = true ↔ todos los dígitos de n son iguales }
}
-}
digitoUnidades :: Integer -> Integer
digitoUnidades n = mod n 10 

sacarUnidades :: Integer -> Integer
sacarUnidades n = div n 10 

{- todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n | n < 10 = True
                      | otherwise = (digitoUnidades) -}

{-
! Ejercicio 13.
? Especificar e implementar la siguiente función:

problema sumatoris (n: Z, m: Z) : Z {
  requiere: { n > 0 }
  asegura: { resultado = sumatoria }
}
-}

g :: Int -> Int -> Int
g 0 _ = 0
g m i = g (m - 1) i + i^m

f :: Int -> Int -> Int
f 0 _ = 0
f n m = f (n - 1) m + g n m 