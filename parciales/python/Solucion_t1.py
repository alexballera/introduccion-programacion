s1 = [1, 3, 0, 1]
s2 = [4, 0, 2, 3]

# Ej 2
def mezclar(s1: list[int], s2: list[int]) -> list[int]:
  s3: list[int] = []
  for i in range(len(s1)):
    s3.append(s1[i])
    s3.append(s2[i])
  return s3

mezclar(s1, s2)

# Ej 3
caballos= ["linda", "petisa", "mister", "luck" ]
carreras= {
  "carrera1": ["linda", "petisa", "mister", "luck"],
  "carrera2":["petisa", "mister", "linda", "luck"]
}

def frecuencia_posiciones_por_caballo(caballos: list[str], carreras: dict[str, list[str]]) -> dict[str, list[int]]:
  res = {}

  for caballo in caballos:
    res[caballo] = [0]*len(caballos)

  for posiciones in carreras.values():
    posicion: int = 0
    for caballo in posiciones:
      res[caballo][posicion] += 1
      posicion += 1

  return res
frecuencia_posiciones_por_caballo(caballos, carreras)

# 4
m = [[1,2,2,1],[-5,6,6,-5],[0,1,1,0]]
def matriz_capicua(m: list[list[int]]) -> bool:
  for item in m:
    if not es_capicua(item):
      return False
  return True

def reverso(lista: list[int]) -> list[int]:
  lista_reversed = []
  for i in range(0, len(lista)):
    lista_reversed.append(lista[len(lista) - i - 1])
  return lista_reversed

def es_capicua(lista: list[int]) -> bool:
  return (lista == reverso(lista))

matriz_capicua(m)