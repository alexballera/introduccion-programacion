lista1 = ['esta', 'es', 'la', 'lista', 'con', 'res', 'falso']
lista2 = ['esta', 'es', 'la', 'lista', 'con', 'resultado', 'verdadero']

def long_mayor_7_for(lista: list[str]) -> bool:
  for i in range(0, len(lista), 1):
    if (len(lista[i]) > 7):
      print(f'{lista[i]} tiene mas de 7 caracteres')
      return True
  print(f'no hay palabras con más de 7 caracteres')
  return False

def long_mayor_7_for_in(lista: list[str]) -> bool:
  for palabra in lista:
    if len(palabra) > 7:
      print(f'{palabra} tiene más de 7 caracteres')
      return True
  print(f'{lista} no tiene palabra con más de 7 caracteres')
  return False

def long_mayor_7_while(lista: list[str]) -> bool:
  i: int = 0
  while i < len(lista):
    if len(lista[i]) > 7:
      print(f'{lista[i]} tiene mas de 7 caracteres')
      return True
    else:
      i += 1
  print(f'{lista} no tiene palabra con más de 7 caracteres')
  return False

long_mayor_7_for(lista1)
long_mayor_7_for(lista2)
long_mayor_7_for_in(lista1)
long_mayor_7_for_in(lista2)
long_mayor_7_while(lista1)
long_mayor_7_while(lista2)