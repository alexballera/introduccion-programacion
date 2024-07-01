# Ej 1
s = ["LLA", "UP", "LLA", "LLA", "UP"]
def acomodar(s: list[str]) -> list[str]:
  lla = []
  up = []
  res = []
  for item in s:
    if (item == 'LLA'):
      lla.append('LLA')
    else:
      up.append('UP')
  res = up + lla
  return res

acomodar(s)

# Ej 2
s = [1,-2,0,5,-7,3]
u = 5
def pos_umbral(s: list[int], u: int) -> int:
  suma: int = 0
  for i in range(0, len(s)):
    if (s[i] >= 0):
      suma += s[i]
    if(suma > u):
      return i
  return -1

pos_umbral(s, u)

# Ej 3
m = [[1,2,1,2],[-5,6,-5,6],[0,1,0,1]]
mitad = int(len(s)/2)
def primera_parte(s: list[int]) -> list[int]:
  primera_parte = s[0:mitad - 1]
  return primera_parte


def segunda_parte(s: list[int]) -> list[int]:
  segunda_parte = s[mitad - 1:len(s)]
  return segunda_parte

def columnas_repetidas(mat: list[list[int]]) -> bool:
  for lista in mat:
    if (primera_parte(lista) != segunda_parte(lista)):
      return False
  return True
columnas_repetidas(m)

# Ej 4
naciones= ["arg", "aus", "nz", "sud"]
torneos= {2023:["nz", "sud", "arg", "aus"], 2022:["nz", "sud", "aus", "arg"]}
# se debería devolver res = {"arg": [0,0,1,1], "aus": [0,0,1,1], "nz": [2,0,0,0], "sud": [0,2,0,0]}

def cuenta_posiciones_por_nacion(naciones: list[str], torneos: dict[int, list[str]]) -> dict[str, list[int]]:
  res = {}
  
  for nacion in naciones:
    res[nacion] = [0] * len(naciones)
    
  for resultados in torneos.values():
    posicion = 0
    for resultado in resultados:
      res[resultado][posicion] += 1
      posicion += 1

  return res

cuenta_posiciones_por_nacion(naciones, torneos)