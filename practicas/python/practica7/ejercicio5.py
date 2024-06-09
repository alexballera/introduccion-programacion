import numpy as np

listaNumero: list[list[int]] = [[1,2,3], [3,4,5], [5,6,7], [1,5,4]]

# Ejercicios 1 y 2
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

# pertenece_a_cada_uno_version_1(listaNumero, 5)

# Ejercicio 3
def es_matriz(lista: list[list[int]]) -> bool:
  for i in range(0, len(lista)):
    if (len(lista[i]) != len(lista[0])):
      return False
  return True

es_matriz(listaNumero)

# Ejercicio 4
def ordenados(lista: list[int]) -> bool:
  for i in range(0, len(lista) - 1, 1):
    if (lista[i] > lista[i + 1]):
      return False
  return True

def filas_ordenadas(lista: list[list[int]]) -> list[bool]:
  filas_ordenadas_bool: list[bool] = []
  if(es_matriz(lista)):
    for item in lista:
      filas_ordenadas_bool.append(ordenados(item))
  return filas_ordenadas_bool

# filas_ordenadas(listaNumero)

def elevarMatriz(dim:int, pot:int) -> [[int]]: # type: ignore
    matriz = np.random.randint(0, 10, (dim, dim))
    return np.linalg.matrix_power(matriz, pot)
elevarMatriz(2,1)