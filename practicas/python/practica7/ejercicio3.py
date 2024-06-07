pedro: list[int] = [6,7,8,10]
juan: list[int] = [4,5,7,8]
jose: list[int] = [3,4,4]

def promedio(notas: list[int]) -> float:
  mean: float = 0
  for num in notas:
    mean = mean + num
  mean = mean / len(notas)
  return mean

def menor_a_cuatro(notas: list[int]) -> bool:
  for num in notas:
    if (num < 4):
      return True
  return False

def aprobacion(notas: list[int]) -> int:
  if (menor_a_cuatro(notas) or (promedio(notas) < 4)):
    return 3
  elif ((not menor_a_cuatro(notas)) and (promedio(notas) >= 7)):
    return 1
  else:
    return 2

aprobacion(jose)
aprobacion(juan)
aprobacion(pedro)