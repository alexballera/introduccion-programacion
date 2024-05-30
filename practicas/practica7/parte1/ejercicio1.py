lista: [int] = [1,2,3,4,5]

# 1. problema pertenece
def pertenece_for(lista: [int], n: int) -> bool:
    for num in lista:
        if num == n:
            print(f'{n} pertenece a la lista')
            return True
    print(f'{n} no pertenece a la lista')
    return False

def pertenece_while(lista: [int], n: int) -> bool:
    i: int = 0
    while i < len(lista):
        if n == lista[i]:
            print(f'{n} pertenece a la lista')
            return True
        i += 1
    print(f'{n} no pertenece a la lista')

def pertenece_do_while(lista: [int], n: int) -> bool:
    i: int = 0
    while True:
        if i < len(lista):
            if n == lista[i]:
                print(f'{n} pertenece a la lista')
                return True
            i += 1
        else:
            print(f'{n} no pertenece a la lista')
            return False
# Ej 1.
pertenece_for(lista, 5)
pertenece_for(lista, 8)
pertenece_while(lista, 5)
pertenece_while(lista, 8)
pertenece_do_while(lista, 5)
pertenece_do_while(lista, 8)
