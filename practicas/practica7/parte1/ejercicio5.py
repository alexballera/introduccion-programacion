lista1 = ['esta', 'es', 'la', 'lista', 'con', 'res', 'falso']
lista2 = ['esta', 'es', 'la', 'lista', 'con', 'resultado', 'verdadero']

def long_mayor_7_for(lista: [str]) -> bool:
  for palabra in lista:
    if len(palabra) > 7:
      print(f'{palabra} tiene más de 7 caracteres')
      return True
  print(f'{lista} no tiene palabra con más de 7 caracteres')
  return False

def long_mayor_7_while(lista: [str]) -> bool:
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
long_mayor_7_while(lista1)
long_mayor_7_while(lista2)