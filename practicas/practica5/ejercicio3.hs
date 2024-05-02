{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}
module Ejercicio3 where
import Test.HUnit

lista1 :: [Integer]
lista1 = [1,2,3,4,5,6,7,8,9]
lista2 :: [Integer]
lista2 = [1,2,3,4,5,6,7,8,9,10,11]

-- ? 1. sumatoria :: [Integer] -> Integer
sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria (x:xs) = x + sumatoria xs

-- ! TESTS
-- ? 1. sumatoria 
testSumatoria :: Test
testSumatoria = test [
  "Suma lista 1" ~: sumatoria lista1 ~=? 45,
  "Suma lista 2" ~: sumatoria lista2 ~=? 66
 ]

tests :: Test
tests = TestList [
  TestLabel "testSumatoria" testSumatoria
 ]


correrTests :: IO Counts
correrTests = runTestTT tests