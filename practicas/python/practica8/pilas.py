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

# buscar_el_maximo(generar_numeros_al_azar(cantidad, desde, hasta))

# Ej 11
def esta_bien_balanceada(s: str) -> bool:
  parentesis_apertura: int = 0
  for elem in s:
    if(elem == '('):
      parentesis_apertura += 1
    if (elem == ')'):
      parentesis_apertura -= 1
    if (parentesis_apertura < 0):
      return False
  if (parentesis_apertura > 0):
    return False
  return True

def esta_bien_balanceada_con_pila(s: str) -> bool:
  p = Pila()
  for el in s[::-1]:
    p.put(el)
  
  parentesis_apertura: int = 0
  while (not p.empty()):
    elem = p.get()
    if (elem == '('):
      parentesis_apertura += 1
    if (elem == ')'):
      parentesis_apertura -= 1
    if (parentesis_apertura < 0):
      return False
  if (parentesis_apertura > 0):
    return False
  return True

formulaTrue1 = '1 + (2 x 3 = (20 / 5 ) )'
formulaTrue2 = '10 * (1 + (2 * (=1)))'
formulaFalse = '1 + ) 2 x 3 ( ( )'
# esta_bien_balanceada_con_pila(formulaFalse)

# Ej 12
def evaluar_expresion(s: str) -> float:
  operandos = ['+', '-', '/', '*']
  p = Pila()
  tokens = s.split(" ")
  for elem in tokens:
    if('0' <= elem <= '9'):
      p.put(elem)
    elif (elem in operandos):
      op2 = int(p.get(elem))
      op1 = int(p.get(elem))
      if(elem == '+'):
        p.put(op1 + op2)
      if(elem == '-'):
        p.put(op1 - op2)
      if(elem == '*'):
        p.put(op1 * op2)
      if(elem == '/'):
        p.put(op1 / op2)
  return p.get()

expresion = "3 4 + 5 * 2 -"
resultado = evaluar_expresion(expresion)
print(resultado) # Deber´ıa devolver 33