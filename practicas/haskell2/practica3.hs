{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}

{-# HLINT ignore "Use uncurry" #-}
{-# HLINT ignore "Use even" #-}
module Practica3 where

-- 1a
f :: Integer -> Integer
f n
  | n == 1 = 8
  | n == 4 = 131
  | n == 16 = 16

-- 1b
g :: Integer -> Integer
g n
  | n == 8 = 16
  | n == 16 = 4
  | n == 131 = 1

-- 1c
h :: Integer -> Integer
h n = f (g n)

k :: Integer -> Integer
k = g . f

-- ! Ejercicio 2
-- 2a
absoluto :: Integer -> Integer
absoluto n
  | n >= 0 = n
  | otherwise = -n

-- 2b
maximoAbsoluto :: Integer -> Integer -> Integer
maximoAbsoluto n m
  | absoluto n >= absoluto m = absoluto n
  | otherwise = absoluto m

-- 2c
maximo3 :: Integer -> Integer -> Integer -> Integer
maximo3 x y z
  | esMayor x y z = x
  | esMayor y x z = y
  | otherwise = z
  where
    esMayor a b c = (a >= b) && (a >= c)

-- 2d
algunoEs0 :: Integer -> Integer -> Bool
algunoEs0 n m = n == 0 || m == 0

algunoEs0PM :: Integer -> Integer -> Bool
algunoEs0PM _ 0 = True
algunoEs0PM 0 _ = True
algunoEs0PM _ _ = False

-- 2e
ambosSon0 :: Integer -> Integer -> Bool
ambosSon0 n m = n == 0 && m == 0

ambosSon0PM :: Integer -> Integer -> Bool
ambosSon0PM 0 0 = True
ambosSon0PM _ _ = False

-- 2f
mismoIntervalo :: Integer -> Integer -> Bool
mismoIntervalo n m
  | intervaloA n && intervaloA m = True
  | intervaloB n && intervaloB m = True
  | intervaloC n && intervaloC m = True
  | otherwise = False
  where
    intervaloA n = n <= 3
    intervaloB n = n > 3 && n < 7
    intervaloC n = n >= 7

-- 2g
sumaDistintos :: Integer -> Integer -> Integer -> Integer
sumaDistintos x y z
  | esIgual x y && esIgual x z && esIgual y z = x
  | esIgual x y = x + z
  | esIgual x z = x + y
  | esIgual y z = x + z
  | otherwise = x + y + z
  where
    esIgual n m = n == m

-- 2h
esMultiploDe :: Integer -> Integer -> Bool
esMultiploDe n m = mod n m == 0

-- 2i
digitoUnidades :: Integer -> Integer
digitoUnidades n = mod (absoluto n) 10

-- 2j
digitoDecenas :: Integer -> Integer
digitoDecenas n = div (mod (absoluto n) 100) 10

-- ! Ejercicio 3
estanRelacionados :: Integer -> Integer -> Bool
estanRelacionados n m = mod n m == 0

-- ! Ejercicio 4
-- 4a
prodInt :: (Integer, Integer) -> (Integer, Integer) -> Integer
prodInt x y = fst x * (fst y + snd y) + snd x * (fst y + snd y)

-- 4b
todoMenor :: (Integer, Integer) -> (Integer, Integer) -> Bool
todoMenor x y = (fst x < fst y) && (snd x < snd y)

-- 4c
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos x y = sqrt (((fst x - fst y) ^ 2) + ((snd x - snd y) ^ 2))

-- 4d
sumaTerna :: (Integer, Integer, Integer) -> Integer
sumaTerna (x, y, z) = x + y + z

-- 4e
sumarSoloMultiplos :: (Integer, Integer, Integer) -> Integer -> Integer
sumarSoloMultiplos (a, b, c) n = esMultiplo a n + esMultiplo b n + esMultiplo c n
  where
    esMultiplo n m
      | mod n m == 0 = n
      | otherwise = 0

-- 4f
posPrimerPar :: (Integer, Integer, Integer) -> Integer
posPrimerPar (a, b, c)
  | esPar a = 0
  | esPar b = 1
  | esPar c = 2
  | otherwise = 4
  where
    esPar n = mod n 2 == 0

-- 4g
crearPar :: a -> b -> (a, b)
crearPar a b = (a, b)

-- 4h
invertir :: (a, b) -> (b, a)
invertir (a, b) = (b, a)

-- ! Ejercicio 5
todoMenores :: (Integer, Integer, Integer) -> Bool
todoMenores (a, b, c) = (f5 a > g5 a) && (f5 b > g5 b) && (f5 c > g5 c)

f5 :: Integer -> Integer
f5 n
  | n <= 7 = n ^ 2
  | otherwise = 2 * n - 1

g5 :: Integer -> Integer
g5 n
  | mod n 2 == 0 = div n 2
  | otherwise = 3 * n + 1

-- ! Ejercicio 6
bisiesto :: Integer -> Bool
bisiesto n = not ((mod n 4 /= 0) || (mod n 100 == 0 && mod n 400 /= 0))

-- ! Ejercicio 7
distanciaManhattan :: (Float, Float, Float) -> (Float, Float, Float) -> Float
distanciaManhattan (a, b, c) (p, q, r) = abs (a - p) + abs (b - q) + abs (c - r)

-- ! Ejercicio 8
comparar :: Integer -> Integer -> Integer
comparar n m
  | sumaUltimoDosDigitos n < sumaUltimoDosDigitos m = 1
  | sumaUltimoDosDigitos n > sumaUltimoDosDigitos m = -1
  | otherwise = 0
  where
    sumaUltimoDosDigitos n = ultimoDigito n + penultimoDigito n
    ultimoDigito n = mod n 10
    penultimoDigito n = ultimoDigito (div n 10)