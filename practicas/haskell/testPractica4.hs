import Practica4
import Test.HUnit

testFibonacci :: Test
testFibonacci = test [
  "Caso Base 1: fibonacci 0" ~: fibonacci 0 ~=? 0,
  "Caso Base 2: fibonacci 1" ~: fibonacci 1 ~=? 1,
  "Caso Recursivo: fibonacci 2" ~: fibonacci 2 ~=? 1
  ]

testParteEntera :: Test
testParteEntera = test [
 "Caso 1: 0 a 1: parteEntera 0.23432" ~: parteEntera 0.23432 ~=? 0,
 "Caso 2: n > 1: 1.23432" ~: parteEntera 1.23432 ~=? 1,
 "Caso 3: n < 0: (-2.23432)" ~: parteEntera (-2.23432) ~=? -2
 ]

testEsPrimo :: Test
testEsPrimo = test [
  "Caso 1: No es primo 4:" ~: esPrimo 4 ~=? False,
  "Caso 2: Es primo 5:" ~: esPrimo 5 ~=? True
 ]

testEsCoprimo :: Test
testEsCoprimo = test [
  "Caso 1: No son coPrimos 7 y 5:" ~: sonCoprimos 7 5 ~=? True,
  "Caso 2: Son coPrimos 5 y 25:" ~: sonCoprimos 5 25 ~=? False
 ]

testEnesimo :: Test
testEnesimo = test [
  "Test 1 n = 1:" ~: nEsimoPrimo 1 ~=? 2,
  "Test 2 n = 2:" ~: nEsimoPrimo 2 ~=? 3,
  "Test 2 n = 4:" ~: nEsimoPrimo 4 ~=? 7,
  "Test 2 n = 7:" ~: nEsimoPrimo 7 ~=? 17,
  "Test 2 n = 8:" ~: nEsimoPrimo 8 ~=? 19
 ]

testEsFibonacci :: Test
testEsFibonacci = test [
  "Test 1 n = 1:" ~: esFibonacci 1 ~=? True,
  "Test 2 n = 55:" ~: esFibonacci 55 ~=? True,
  "Test 2 n = 234:" ~: esFibonacci 234 ~=? False,
  "Test 2 n = 1597:" ~: esFibonacci 1597 ~=? True,
  "Test 2 n = 196419:" ~: esFibonacci 196419 ~=? False
 ]

testMayorDigitoPar :: Test
testMayorDigitoPar = test [
  "CasoBase1 = n < 10 && esPar:" ~: mayorDigitoPar 2 ~=? 2,
  "CasoBase2 = n < 10:" ~: mayorDigitoPar 1 ~=? -1,
  "Caso 3:" ~: mayorDigitoPar 234 ~=? 4,
  "Caso 4:" ~: mayorDigitoPar 15897 ~=? 8,
  "Caso 5:" ~: mayorDigitoPar 619419 ~=? 6
 ]

testEsSumaInicialDePrimos :: Test
testEsSumaInicialDePrimos = test [
  "CasoBase1: n = 0" ~: esSumaInicialDePrimos 0 ~=? False,
  "CasoBase2: n = 1" ~: esSumaInicialDePrimos 1 ~=? False,
  "Caso 1: n = 3" ~: esSumaInicialDePrimos 3 ~=? False,
  "Caso 2: n = 5" ~: esSumaInicialDePrimos 5 ~=? True,
  "Caso 3: n = 8" ~: esSumaInicialDePrimos 8 ~=? False,
  "Caso 4: n = 12" ~: esSumaInicialDePrimos 12 ~=? False,
  "Caso 5: n = 100" ~: esSumaInicialDePrimos 100 ~=? False
 ]

tests :: Test
tests = TestList [
  TestLabel "testFibonacci" testFibonacci,
  TestLabel "testParteEntera" testParteEntera,
  TestLabel "testEsPrimo" testEsPrimo,
  TestLabel "testEsCoprimo" testEsCoprimo,
  TestLabel "testEsFibonacci" testEsFibonacci,
  TestLabel "testMayorDigitoPar" testMayorDigitoPar,
  TestLabel "testEsSumaInicialDePrimos" testEsSumaInicialDePrimos
  ]

correrTests = runTestTT tests