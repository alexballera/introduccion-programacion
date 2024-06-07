# Ejercicio 1
def ingresar_nombres() -> list[str]:
  nombre: str = ''
  nombres: list[str] = []
  while (nombre != 'listo'):
    nombre = input('Ingrese los nombres de los alumnos, \npara finalizar ingrese "listo": ')
    if (nombre != 'listo' and nombre != ''):
      nombres.append(nombre)
  print(f'nombres: {nombres}')
  return nombres

ingresar_nombres()