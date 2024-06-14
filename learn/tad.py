# Pilas
from queue import LifoQueue as Pila

pila1 = Pila()
pila2 = Pila()
pila3 = Pila()

lista1 = ['a','e','i','o','u']
lista2 = [1,2,3,4,5,6,7,8,9]
lista3 = []

for item in lista1:
  pila1.put(item)
print(f'último pila1: {pila1.get()}')
pila1.put(lista1[len(lista1) - 1])

for i in range(len(lista2)):
  pila2.put(lista2[i])
print(f'último pila2: {pila2.get()}')

while(not pila1.empty()):
  lista3.append(pila1.get())

for item in lista3:
  pila3.put(item)
print(f'lista3: {lista3}')

print()

# Colas
import queue
cola1 = queue.Queue()
cola2 = queue.Queue()
cola3 = queue.Queue()

lista4 = ['a','e','i','o','u']
lista5 = [1,2,3,4,5,6,7,8,9]
lista6 = []

for item in lista4:
  cola1.put(item)
print(f'primer cola1 {cola1.get()}')

for i in range(len(lista5)):
  cola2.put(lista5[i])
print(f'primer cola2 {cola2.get()}')

i = 0
while (i < len(lista5)):
  cola3.put(lista5[i])
  i += 1
print(f'primer cola3 {cola3.get()}')

while (not cola3.empty()):
  lista6.append(cola3.get())
print(f'lista6 {lista6}')