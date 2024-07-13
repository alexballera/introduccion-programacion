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