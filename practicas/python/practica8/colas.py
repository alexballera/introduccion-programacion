from queue import Queue as Cola
import random

# Ej 13
def generar_nros_al_azar(cantidad: int, desde: int, hasta: int) -> Cola[int]:
  c = Cola()
  for i in range(0, cantidad):
    c.put(random.randint(desde, hasta))
  
  return c

cantidad = 4
desde = 1
hasta = 10
# generar_nros_al_azar(cantidad, desde, hasta)

# Ej 14
def cantidad_elementos(c: Cola) -> int:
  contador: int = 0
  while(not c.empty()):
    c.get()
    contador += 1
  print(contador)
  return contador

cantidad_elementos(generar_nros_al_azar(cantidad, desde, hasta))

# Ej 15
def buscar_el_maximo(c: Cola[int]) -> int:
  primer_elemento = c.get()
  while(not c.empty()):
    segundo_elemento = c.get()
    if(primer_elemento < segundo_elemento):
      primer_elemento = segundo_elemento
  return primer_elemento

# buscar_el_maximo(generar_nros_al_azar(cantidad, desde, hasta))