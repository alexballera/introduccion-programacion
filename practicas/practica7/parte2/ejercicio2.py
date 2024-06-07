lista: list[int] = [1,2,3,4,5,6,7,8,9,10]

def modificarPosicionPar(lista: list[int]) -> list[int]:
  nueva_lista: list[int] = []
  for i in range(0, len(lista), 1):
    if (i % 2 == 0):
      lista[i] = 0
    nueva_lista.append(lista[i])
  return nueva_lista

modificarPosicionPar(lista)