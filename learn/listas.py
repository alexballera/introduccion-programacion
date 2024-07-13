lista1 = [1,2,2,3,4,5,6,7,8,9]
lista2 = [1,2,3,4,5,6,7,8,9]
lista3 = [1,2,3,4,5,6,7,8,9]
lista4 = [1,2,3,4,5,6,7,8,9,10]
lista5 = [1,2,3,4,5,6,7,8,9,10]

print('lista1.pop()')
print(f'lista1 = {lista1}')
# list.pop() elimina el último elemento
# list.pop([i]) elimina el elemento en la posición i
lista1.pop() # elimina el último elemento
print(f'pop() = {lista1}')
lista1.pop(1) # elimina el elemento en la posición 1
print(f'pop(1) = {lista1}')

print()
print('insert')

# list.insert(i, x)
# Inserta un ítem en una posición dada.
# El primer argumento es el índice del ítem delante
# del cual se insertará, por lo tanto a.insert(0, x)
# inserta al principio de la lista y
# a.insert(len(a), x) equivale a a.append(x)
lista1.insert(1, 2)
lista1.insert(len(lista1), 9) # equivale a a.append(x)
print(f'lista1.insert(1, 2) & lista1.insert(len(lista1), 9) = {lista1}')

# list.remove(x)
# Quita el primer ítem de la lista1 cuyo valor sea x
print('remove')
lista1.remove(2)
print(f'lista1.remove(2) = {lista1}')

print()

print('list.append(x)')
# agrega item al final de la lista
lista1[len(lista1):] = [10]
print(f'lista1 {lista1}')

lista2.append(10)
print(f'lista2 {lista2}')

print()

print('list.extend(iterable)')
# Extiende la lista agregándole todos los ítems del iterable. Equivale a a[len(a):] = iterable
lista4[len(lista4):] = lista1
print(f'extend {lista4}')
lista5.extend(lista1)
print(f'extend {lista5}')

print()

print('list.index(x[, start[, end]])')
# Retorna el índice basado en cero del primer
# elemento cuyo valor sea igual a x
index = lista1.index(1)
print(f'index de 1 {index}')

print()

print('list.count(x)')
# Retorna el número de veces que x aparece en la lista.
numero = lista1.count(2)
print(f'cantidad 2 {numero}')

print()

print('list.copy()')
# Retorna una copia superficial de la lista. Equivalente a a[:]
copia1 = lista1.copy()
print(f'copia {copia1}')

copia2 = lista2[:]
print(f'copia2 {copia2}')

print()

print('reverse')
# reverse con for
reverse_for = []
for i in range(len(lista1)):
  reverse_for.append(lista1.pop())
print(f'reverse_for {reverse_for}')

# reverse con while
reverse_while = []
i = len(lista1)
while(i > 0):
  reverse_while.append(lista1.pop())
  i -= 1
print(f'reverse_while {reverse_while}')

# reverse nativo
reverse3 = []
lista3.reverse()
print(f'reverse_nativo {lista3}')

print()

print('list.clear()')
# Elimina todos los elementos de la lista. Equivalente a del a[:]
lista1.clear()
print(f'clear lista1 {lista1}')
lista2[:]
print(f'clear lista2[:] {lista2}')

print()
print('Comprensión de listas')
# Comprensión de listas
# Una lista de comprensión consiste de corchetes rodeando
# una expresión seguida de la declaración for y luego cero
# o más declaraciones for o if. El resultado será una nueva
# lista que sale de evaluar la expresión en el contexto de
# los for o if que le siguen. Por ejemplo, esta lista de
# comprensión combina los elementos de dos listas si no son iguales

cuadrados = []
for i in range(10):
  cuadrados.append(i**2)
print(f'cuadrados {cuadrados}')

# lista_comprension1:
lista_comprension1 = [x**2 for x in range(10)]
print(f'lista_comprension1 {lista_comprension1}')
combs = []
for x in [1,2,3]:
    for y in [3,1,4]:
        if x != y:
            combs.append((x, y))
print(f'combs {combs}')

# lista_comprension2:
lista_comprension2 = [(x, y) for x in [1,2,3] for y in [3,1,4] if x != y]
print(f'lista_comprension2 {lista_comprension2}')

vec = [[1,2,3], [4,5,6], [7,8,9]]
[num for elem in vec for num in elem]
print(f'lista de lista {vec}')

print()

# Listas por comprensión anidadas (matrices)
matrix = [
    [1, 2, 3, 4],
    [5, 6, 7, 8],
    [9, 10, 11, 12],
]
print(f'matrix {matrix}')

# transponder la matriz
transpuesta = []
for i in range(4):
  row_transpuesta = []
  for row in matrix:
    row_transpuesta.append(row[i])
  transpuesta.append(row_transpuesta)
print(f'transpuesta {transpuesta}')

print()
# matriz transpuesta usando comprensión
print('matriz transpuesta usando comprensión')
transpuesta_comprension1 = []
transpuesta_comprension1 = [[row[i] for row in matrix] for i in range(4)]
print(f'matriz transpuesta_comprension1 {transpuesta_comprension1}')

transpuesta_comprension2 = []
for i in range(4):
  transpuesta_comprension2.append([row[i] for row in matrix])
print(f'matriz transpuesta_comprension2 {transpuesta_comprension2}')
