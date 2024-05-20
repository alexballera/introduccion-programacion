s = [1,2,3]
def sumaTotal(lista):
    i = 0
    suma = 0
    while i < len(lista):
        suma += lista[i]
        i += 1
    return suma

suma = sumaTotal(s)
print(suma)