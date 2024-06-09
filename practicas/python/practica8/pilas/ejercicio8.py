from queue import LifoQueue as Pila
import random

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
generar_numeros_al_azar(cantidad, desde, hasta)