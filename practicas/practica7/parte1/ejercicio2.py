listaPar: [int] = [2,4,6,8,10]

# 2. problema divide a todos
def divide_a_todos_for(lista: [int], n: int) -> bool:
    if n == 0:
        print(f'No se divide por {n}')
        return False
    for num in lista:
        if num % n != 0:
            print(f'{n} no divide a todos')
            return False
        else:
            print(f'{n} divide a todos')
            return True

def divide_a_todos_while(lista: [int], n: int) -> bool:
    if n == 0:
        print(f'No se divide por {n}')
        return False
    i: int = 0
    while i < len(lista):
        if lista[i] % n != 0:
            print(f'{n} no divide a todos')
            return False
        else:
            i += 1
    print(f'{n} divide a todos')
    return True

divide_a_todos_for(listaPar, 3)
divide_a_todos_for(listaPar, 2)
divide_a_todos_while(listaPar, 3)
divide_a_todos_while(listaPar, 2)
