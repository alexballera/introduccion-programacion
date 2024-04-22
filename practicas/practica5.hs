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
! Ejercicio 2.1

? Implementar pertenece :: (Eq t) => t -> [t] -> Bool
según la siguiente especificación

problema pertenece (e: T , s: seq⟨T ⟩) : B {
requiere: { T rue }
asegura: { resultado = true ↔ e ∈ s }
}
-}