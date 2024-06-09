from queue import LifoQueue as Pila
import random

# Ej 8
def generar_numeros_al_azar(cantidad: int, desde: int, hasta: int) -> Pila[int]:
  p = Pila()
  i: int = 0
  while(i < cantidad):
    p.put(random.randint(desde, hasta))
    i += 1

  return p

cantidad = 5
desde = 1
hasta = 10
# generar_numeros_al_azar(cantidad, desde, hasta)

# Ej 9
def cantidad_elementos(p: Pila) -> int:
  original = []
  contador: int = 0

  while(not p.empty()):
    original.append(p.get())
    contador += 1

  # Se restituyen los elementos de p
  # se revierte la pila ya que al guardarlos
  # el primero original quedó de último
  for elem in original[::-1]:
    p.put(elem)

  return contador

# cantidad_elementos(generar_numeros_al_azar(cantidad, desde, hasta))

# Ej 10
def buscar_el_maximo(p: Pila[int]) -> int:
  """ lista = []
  while(not p.empty()):
    lista.append(p.get())
  maximo = max(lista)
  print(maximo) """
  
  # sin usar max
  primer_elemento = p.get()
  while(not p.empty()):
    segundo_elemento = p.get()
    if(primer_elemento < segundo_elemento):
      primer_elemento = segundo_elemento
  
  print(primer_elemento)

buscar_el_maximo(generar_numeros_al_azar(cantidad, desde, hasta))