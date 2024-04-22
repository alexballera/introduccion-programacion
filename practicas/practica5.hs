{-
! Ejercicio 2.1

? Implementar pertenece :: (Eq t) => t -> [t] -> Bool
según la siguiente especificación

problema pertenece (e: T , s: seq⟨T ⟩) : B {
  requiere: { T rue }
  asegura: { resultado = true ↔ e ∈ s }
}
-}

pertenece :: (Eq t) => t -> [t] -> Bool

pertenece _ [] = False
pertenece x (y:ys) | x == y = True
                   | otherwise = pertenece x ys 

{-
! Ejercicio 2.4
? Definir la siguiente función sobre listas:
? hayRepetidos :: (Eq t) => [t] -> Bool
problema hayRepetidos (s: seq⟨T ⟩) : B {
  requiere: { T rue }
  asegura: { resultado = true ↔ existen dos posiciones
  distintas de s con igual valor }
}
Sugerencia: Utilizar la funci´on pertenece del ej 2.1
}
-}

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] = False
hayRepetidos (x:xs) = (pertenece x xs) || hayRepetidos xs

{-
! Ejercicio 2.5
? Implementar quitar :: (Eq t) => t -> [t] -> [t], que
? dados un entero x y una lista xs, elimina la primera aparición de x
? en la lista xs (de haberla)
}
-}

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar x (y:ys)
 | x == y = ys
 | otherwise = y:(quitar x ys )