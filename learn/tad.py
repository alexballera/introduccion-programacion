# Pilas
print('Pilas')
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
print('Colas')
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

print()

# Diccionario
print('Diccionario')

tel = {'jack': 4098, 'sape': 4139}
tel['guido'] = 4127
print(f'tel {tel}')

tel['jack']
tel['irv'] = 4127
print(f'tel {tel}')
print(f'list(tel) = {list(tel)}')

print()

guido = 'guido' in tel
print(f'guido in tel = {guido}')
jack = 'jack' not in tel
print(f'jack not in tel = {jack}')

print()

dictado1 = dict([('sape', 4139), ('guido', 4127), ('jack', 4098)])
print(f'dictado = {dictado1}')

# Cuando las claves son cadenas simples, a veces resulta más fácil especificar los pares usando argumentos por palabra clave:
dictado2 = dict(sape=4139, guido=4127, jack=4098)
print(f'dictado2 = {dictado2}')

print(f'list(dictado1)  = {list(dictado1)}')
print(f'len(dictado1)  = {len(dictado1)}')
print(f'dictado1["sape"]  = {dictado1["sape"]}')

print()

# key in d: Retorna True si d tiene una entrada en la clave key, False en caso contrario
pertenece = 'sape' in dictado1
print(f'"sape" in dictado1 {pertenece}')
no_pertenece = not 'sape' in dictado1
print(f'not "sape" in dictado1 {no_pertenece}')

print()

print('iteracion')
# items() Retorna una nueva vista de los elementos del diccionario (pares (key, value))
knights = {'gallahad': 'the pure', 'robin': 'the brave'}
for k, v in knights.items():
    print(k, v)

