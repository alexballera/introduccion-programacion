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