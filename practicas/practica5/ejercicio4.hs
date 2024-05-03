{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use list literal pattern" #-}
module Ejercicio4 where
import Test.HUnit

lista1 = "Ho    la m  u  n  d  o"

-- ? a) sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = []
sacarBlancosRepetidos (x:[]) = [x]
sacarBlancosRepetidos (x:y:xs) | x == y && x == ' ' = sacarBlancosRepetidos (y:xs)
                               | otherwise = x : sacarBlancosRepetidos (y:xs)

-- ? TESTS
-- ? a) sacarBlancosRepetidos
testSacarBlancosRepetidos :: Test
testSacarBlancosRepetidos = test [
  "sacar lista1" ~: sacarBlancosRepetidos lista1 ~=? "Ho la m u n d o"
 ]

tests = TestList [
  TestLabel "testSacarBlancosRepetidos" testSacarBlancosRepetidos
 ]

corrertests :: IO Counts
corrertests = runTestTT tests