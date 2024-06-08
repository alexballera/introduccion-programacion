# Ejercicios 1 y 2
listaNumero: list[list[int]] = [[1,2,3], [5,1,3]]

def pertenece(lista: list[int], num: int) -> bool:
  for numero in lista:
    if numero == num:
      return True
  return False

def pertenece_a_cada_uno_version_1(lista: list[list[int]], num: int) -> list[bool]:
  listaPerteneceNumero: list[list[int]] = []
  for item in lista:
    listaPerteneceNumero.append(pertenece(item, num))
  return listaPerteneceNumero

pertenece_a_cada_uno_version_1(listaNumero, 5)