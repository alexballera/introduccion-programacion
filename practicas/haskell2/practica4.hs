{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Redundant bracket" #-}
{-# HLINT ignore "Eta reduce" #-}
module Practica4 where

-- ! Ejercicio 1
fibonacci :: Integer -> Integer
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci (n - 2)

-- ! Ejercicio 2
parteEntera :: Float -> Integer
parteEntera n
  | n >= 0 && n < 1 = 0
  | n >= 1 = 1 + parteEntera (n - 1)
  | otherwise = -((-1) + parteEntera (-n + 1))

-- ! Ejercicio 3
esDivisible :: Integer -> Integer -> Bool
esDivisible n _ | n == 0 = True
esDivisible n m
  | n >= m = esDivisible (n - m) m
  | otherwise = False

-- ! Ejercicio 4
sumaImpares :: Integer -> Integer
sumaImpares 0 = 0
sumaImpares 1 = 1
sumaImpares n | n > 1 = (2 * n) - 1 + sumaImpares (n - 1)

-- ! Ejercicio 5
medioFact :: Integer -> Integer
medioFact n | n <= 1 = 1
medioFact n = n * medioFact (n - 2)

-- ! Ejercicio 6
sumaDigitos :: Integer -> Integer
sumaDigitos n
  | n < 10 = n
  | otherwise = sumaDigitos (div n 10) + (mod n 10)

-- ! Ejercicio 7
todosDigitosIguales :: Integer -> Bool
todosDigitosIguales n
  | n < 10 = True
  | mod n 10 == mod (div n 10) 10 = todosDigitosIguales (div n 10)
  | otherwise = False

-- ! Ejercicio 8
iesimoDigito :: Integer -> Integer -> Integer
iesimoDigito n i
  | cantidadDigito n == i = mod n 10
  | n > i = iesimoDigito (div n 10) i
  where
    cantidadDigito n | n < 10 = 1
    cantidadDigito n = 1 + cantidadDigito (div n 10)

-- ! Ejercicio 9
esCapicua :: Integer -> Bool
esCapicua n
  | longitud n == 1 = True
  | mostrarPrimero n == mostrarUltimo n = esCapicua (quitarPrimero (quitarUltimo n))
  | otherwise = False
  where
    mostrarPrimero n = div n (10 ^ (longitud n - 1))
    quitarPrimero n = mod n (10 ^ (longitud n - 1))
    mostrarUltimo n = mod n 10
    quitarUltimo n = div n 10
    longitud n | n < 10 = 1
    longitud n = 1 + longitud (div n 10)

-- ! Ejercicio 10
-- 10a
f1 :: Integer -> Integer
f1 0 = 1
f1 n = 2 ^ n + f1 (n - 1)

-- 10b
f2 :: Integer -> Integer -> Integer
f2 1 q = q
f2 n q = q ^ n + f2 (n - 1) q

-- 10c
f3 :: Integer -> Integer -> Integer
f3 n q = f2 (2 * n) q

-- 10d
f4 :: Integer -> Integer -> Integer
f4 n q = f2 (2 * n) q - f2 (n - 1) q

-- ! Ejercicio 11
-- 11a
eAprox :: Integer -> Float
eAprox 0 = 1
eAprox 1 = 2
eAprox n = eAprox (n - 1) + (1 / fromIntegral (factorial n))
  where
    factorial 0 = 1
    factorial n = n * factorial (n - 1)

-- 11b
e :: Float
e = eAprox 10

-- ! Ejercicio 12
raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = f n - 1

f :: Integer -> Float
f 1 = 2
f n = 2 + 1 / f (n - 1)