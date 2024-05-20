def sumaTotal(lista):
    i = 0
    suma = 0
    while i < len(lista):
        suma += lista[i]
        i += 1
    return suma

suma = sumaTotal([1,2,3])
print(suma)