lista: list[int] = [1,2,3,4,5]

# 3. problema suma total
def suma_total_while(lista: list[int]) -> int:
    i: int = 0
    suma: int = 0
    while i < len(lista):
        suma += lista[i]
        i += 1
    return suma

def suma_total_do_while(lista: list[int]) -> int:
    i: int = 0
    suma: int = 0
    while True:
        suma += lista[i]
        i += 1
        if i == len(lista):
            return suma

def suma_total_for(lista: list[int]) -> int:
    suma: int = 0
    for i in range(0, len(lista), 1):
        suma = suma + lista[i]
    return suma

def suma_total_for_in(lista: list[int]) -> int:
    suma: int = 0
    for numero in lista:
        suma += numero
    return suma

print(suma_total_while(lista))
print(suma_total_do_while(lista))
print(suma_total_for(lista))
print(suma_total_for_in(lista))
