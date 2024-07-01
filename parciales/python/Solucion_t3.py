# Ej 1
super1 = [("leche",151.0),("yerba",4719.5),("jabón",269.2)]
super2 = [("leche",261.2),("yerba",3939.1),("jabón",319.2)]

def mejores_precios(super1: list[(str, int)], super2: list[(str, int)]) -> list[(str, int)]:
  res = []
  for i in range(0, len(super1)):
    if(super1[i][1] < super2[i][1]):
      res.append((super1[i][0], super1[i][1]))
    else:
      res.append((super2[i][0], super2[i][1]))
  """ contador = 0
  for producto in super1:
    if (producto[1] > super2[contador][1]):
      producto = (producto[0], super2[contador][1])
      res.append(producto)
    else:
      producto = producto[0], producto[1]
      res.append(producto)
    contador += 1 """
  return res

mejores_precios(super1, super2)

# Ej 2
calificaciones1 = [10,55,60,87,54,98,87,65,55,45,57]
calificaciones2 = [10,55,60,65,54,64,65,55,45,57]
nota_minima1 = 60 # 3
nota_minima2 = 70 # 0

def quitar_repetido(lista: list[int]) -> list[int]:
  lista_nueva = []
  for i in range(0, len(lista)):
    if not (lista[i] in lista_nueva):
      lista_nueva.append(lista[i])
  return lista_nueva
    

def seguidilla(calificaciones: list[int], nota_minima: int) -> int:
  lista_mayores = []
  sin_repetidos = quitar_repetido(calificaciones)
  for nota in sin_repetidos:
    if (nota > nota_minima):
      lista_mayores.append(nota)

  return len(lista_mayores)

# seguidilla(calificaciones1, nota_minima1) # res = 3
seguidilla(calificaciones2, nota_minima2) # res = 0

# Ej 3
elem = 1
M = [
  [1,2,3,4,5,6,7,8,9],
  [9,8,7,6,4,5,3,2,1],
  [0,0,0,0,0,0,1,0,0],
  [0,0,0,0,0,4,0,0,0],
  [0,1,0,0,6,0,0,1,0]
  ]

# res=[true,true,true,false,false]
def indices_pares(lista: list[int]) -> list[int]:
  nueva_matriz = []
  print(f'lista {lista}')
  for i in range(0, len(lista)):
    if (i % 2 == 0):
      nueva_matriz.append(lista[i])
  return nueva_matriz
      
def elem_en_pos_pares(matriz: list[list[int]], elem: int) -> list[bool]:
  res = []
  nueva_matriz = []
  for linea in matriz:
    res.append(elem in indices_pares(linea))
  print(nueva_matriz)
  return res

elem_en_pos_pares(M, elem)