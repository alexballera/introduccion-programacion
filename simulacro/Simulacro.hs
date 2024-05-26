module Simulacro where

lista1 :: [(String, String)]
lista1 = [("ana", "ana")]
lista2 :: [(String, String)]
lista2 = [("ana", "pedro"), ("ana", "pedro")]
lista3 :: [(String, String)]
lista3 = [("ana", "pedro"), ("pedro", "ana"), ("pedro", "ana")]
lista4 :: [(String, String)]
lista4 = [("ana", "pedro"), ("ana", "carlos")]

relacionesValidas :: [(String, String)] -> Bool
relacionesValidas [] = True
relacionesValidas ((a,b):xs)
  | tieneMismaPersona ((a,b):xs) || primeraTuplaRepetidas ((a,b):xs)= False
  | otherwise = relacionesValidas xs
  where
  tieneMismaPersona [] = False
  tieneMismaPersona ((a,b):xs) | a == b = True
                               | otherwise = tieneMismaPersona xs
  primeraTuplaRepetidas [(a,b)] = False
  primeraTuplaRepetidas ((a,b):(c,d):xs) | a == c && b == d = True
                                         | otherwise = primeraTuplaRepetidas ((a,b):xs)

personas :: [(String, String)] -> [String]
personas [] = ["nadie"]
personas xs = eliminaTodosRepetidos (listarTodas xs)
  where
    listarTodas [] = []
    listarTodas ((a,b):xs) = a : b : listarTodas xs
    eliminaTodosRepetidos [] = []
    eliminaTodosRepetidos (x:xs) | pertenece x xs = eliminaTodosRepetidos xs
      | otherwise = x : eliminaTodosRepetidos xs
    pertenece _ [] = False
    pertenece p (x:xs) = p == x || pertenece p xs

amigosDe :: String -> [(String, String)] -> [String]
amigosDe _ [] = ["nadie"]

pertenece :: String -> [(String, String)] -> [String]
pertenece _ [] = []
pertenece p ((a,b):xs) | p == a || p == b = [a, b]
 | otherwise = pertenece p xs

personaConMasAmigos :: [(String, String)] -> String
personaConMasAmigos [] = "yo"

