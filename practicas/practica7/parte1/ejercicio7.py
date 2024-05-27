import sys

def tiene_mayuscula (password: str) -> bool:
  i: int = 0
  res = False
  while i < len(password) and not res:
    if 'A' <= password[i] <= 'Z':
     res = True
    i += 1
  return res

def tiene_minuscula (password: str) -> bool:
  i: int = 0
  res = False
  while i < len(password) and not res:
    if 'a' <= password[i] <= 'z':
     res = True
    i += 1
  return res

def tiene_numero (password: str) -> bool:
  i: int = 0
  res = False
  while i < len(password) and not res:
    if '0' <= password[i] <= '9':
     res = True
    i += 1
  return res

def long_menor_5 (password: str) -> bool:
  return len(password) < 5

def long_mayor_8 (password: str) -> bool:
  return len(password) > 8

def fortaleza (password: str) -> str:
  if long_menor_5(password):
      print('ROJO')
  elif  tiene_mayuscula(password) and tiene_minuscula(password) and tiene_numero(password) and long_mayor_8(password):
    print('VERDE')
  else:
    print('AMARILLO')

fortaleza(sys.argv[1])