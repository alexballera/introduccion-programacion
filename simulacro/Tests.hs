import Test.HUnit
import Simulacro
    ( relacionesValidas, lista1, lista2, lista3, lista4 )

-- "nombre" ~: (funcion parametros) ~?= resultado_esperado

testRelacionesValidas = test [
  "componentes repetidas" ~: relacionesValidas lista1 ~?= False,
  "tupla repetida" ~: relacionesValidas lista2 ~?= False,
  "tupla repetida invertida" ~: relacionesValidas lista3 ~?= False,
  "todas diferentes" ~: relacionesValidas lista4 ~?= True
  ]

tests = TestList [
  TestLabel "testRelacionesValidas" testRelacionesValidas
 ]

correrTests :: IO Counts
correrTests = runTestTT tests



-- -- EJEMPLOS

-- USUARIO1 = "JUAN"
-- USUARIO2 = "NATALIA"
-- USUARIO3 = "PEDRO"

-- RELACION1_2 = (USUARIO1, USUARIO2)
-- RELACION1_1 = (USUARIO1, USUARIO1)
-- RELACION1_3 = (USUARIO1, USUARIO3)


-- -- FUNCIONES PARA TESTING, NO BORRAR
-- -- EXPECTANY PERMITE SABER SI EL ELEMENOT QUE DEVUELVE LA FUNCIÓN ES ALGUNO DE LOS ESPERADOS
-- EXPECTANY ACTUAL EXPECTED = ELEM ACTUAL EXPECTED ~? ("EXPECTED ANY OF: " ++ SHOW EXPECTED ++ "\N BUT GOT: " ++ SHOW ACTUAL)


-- -- SONIGUALES PERMITE VER QUE DOS LISTAS SEAN IGUALES SI NO IMPORTA EL ORDEN
-- QUITAR :: (EQ T) => T -> [T] -> [T]
-- -- REQUIERE X PERTENECE A Y
-- QUITAR X (Y:YS)
-- | X == Y = YS
-- | OTHERWISE = Y : QUITAR X YS

-- INCLUIDO :: (EQ T) => [T] -> [T] -> BOOL
-- INCLUIDO [] L = TRUE
-- INCLUIDO (X:C) L = ELEM X L && INCLUIDO C (QUITAR X L)

-- SONIGUALES :: (EQ T) => [T] -> [T] -> BOOL
-- SONIGUALES XS YS = INCLUIDO XS YS && INCLUIDO YS XS 
