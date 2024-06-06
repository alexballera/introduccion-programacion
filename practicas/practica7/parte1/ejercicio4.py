listaOrdenada: list[int] = [2,4,6,8,10]
listaDesordenada: list[int] = [2,4,8,6,10]

# 4. problema ordenados
def problema_ordenados_for(lista: list[int]) -> bool:
    for i in range(0, len(lista) - 1, 1):
        if not(lista[i] < lista [i + 1]):
            print(f'La lista no está ordenada')
            return False
    print(f'La lista está ordenada')
    return True

def problema_ordenados_for_in(lista: list[int]) -> bool:
    for num in lista:
        if lista[0] < lista[1]:
            lista.pop(0)
        else:
            print(f'La lista no está ordenada')
            return False
    print(f'La lista está ordenada')
    return True

def problema_ordenados_while(lista: list[int]) -> bool:
    i: int = 0
    while i < len(lista):
        if lista[0] < lista[1]:
            i += 1
        else:
            print(f'La lista no está ordenada')
            return False
    print(f'La lista está ordenada')
    return True

problema_ordenados_for(listaOrdenada)
problema_ordenados_for(listaDesordenada)
problema_ordenados_for_in(listaOrdenada)
problema_ordenados_for_in(listaDesordenada)
problema_ordenados_while(listaOrdenada)
problema_ordenados_while(listaDesordenada)