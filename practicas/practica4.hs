{-
! *****************************************************************
! Ejercicio 1.
! *****************************************************************

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
fibonacci n | n == 0 = 0
            | n == 1 = 1
            | otherwise = fibonacci (n - 1) + fibonacci (n - 2)

{-
! *****************************************************************
! Ejercicio 2.
! *****************************************************************
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
parteEntera x = if fromIntegral (entero x) <= x
                  then entero x
                  else entero x + 1

{-
! *****************************************************************
! Ejercicio 3.
! *****************************************************************
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