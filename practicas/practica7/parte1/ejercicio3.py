lista: [int] = [1,2,3,4,5]

# 3. problema suma total
def suma_total_while(lista: [int]) -> int:
    i: int = 0
    suma: int = 0
    while i < len(lista):
        suma += lista[i]
        i += 1
    return suma

def suma_total_do_while(lista: [int]) -> int:
    i: int = 0
    suma: int = 0
    while True:
        suma += lista[i]
        i += 1
        if i == len(lista):
            return suma

def suma_total_for(lista: [int]) -> int:
    suma: int = 0
    for numero in lista:
        suma += numero
    return suma

suma1 = suma_total_while(lista)
print(suma1)
suma2 = suma_total_do_while(lista)
print(suma2)
suma3 = suma_total_for(lista)
print(suma3)
