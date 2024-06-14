lista1 = [1,2,2,3,4,5,6,7,8,9]
lista2 = [1,2,3,4,5,6,7,8,9]
lista3 = [1,2,3,4,5,6,7,8,9]
lista4 = [1,2,3,4,5,6,7,8,9,10]

# list.pop() elimina el último elemento
# list.pop([i]) elimina el elemento en la posición i
lista1.pop() # elimina el último elemento
lista1.pop(1) # elimina el elemento en la posición 1
print(f'pop {lista1}')

# list.insert(i, x)
# Inserta un ítem en una posición dada.
# El primer argumento es el índice del ítem delante
# del cual se insertará, por lo tanto a.insert(0, x)
# inserta al principio de la lista y
# a.insert(len(a), x) equivale a a.append(x)
lista1.insert(1, 2)
lista1.insert(len(lista1), 9) # equivale a a.append(x)

# list.remove(x)
# Quita el primer ítem de la lista1 cuyo valor sea x
lista1.remove(2)

# list.append(x)
# agrega item al final de la lista
lista1[len(lista1):] = [10]
print(f'lista1 {lista1}')

lista2.append(10)
print(f'lista2 {lista2}')

# list.extend(iterable)
# Extiende la lista agregándole todos los ítems del iterable. Equivale a a[len(a):] = iterable
# lista4[len(lista4):] = lista1
lista4.extend(lista1)
print(f'extend {lista4}')

# list.index(x[, start[, end]])
# Retorna el índice basado en cero del primer
# elemento cuyo valor sea igual a x
index = lista1.index(1)
print(f'index de 1 {index}')

# list.count(x)
# Retorna el número de veces que x aparece en la lista.
numero = lista1.count(2)
print(f'cantidad 2 {numero}')

# list.copy()
# Retorna una copia superficial de la lista. Equivalente a a[:]
copia1 = lista1.copy()
print(f'copia {copia1}')
copia2 = lista2[:]
print(f'copia2 {copia2}')

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

# list.clear()
# Elimina todos los elementos de la lista. Equivalente a del a[:]
lista1.clear()
print(f'clear {lista1}')
lista2[:]
print(f'clear lista2[:] {lista2}')
