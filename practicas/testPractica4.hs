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

tests :: Test
tests = TestList [
  TestLabel "testFibonacci" testFibonacci,
  TestLabel "testParteEntera" testParteEntera
  ]
