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

# ingresar_nombres()

# Ejercicio 2
def historial_movimientos() -> list[(str, int)]:
  tipo: str = ''
  monto: int = 0
  movimientos: list[(str, int)] = []
  while (tipo != 'X'):
    tipo = input('\nIngrese la letra del tipo de operación: \n\n "C" = Cargar crédito \n "D" = Descontar créditos \n "X" = Finalizar\n')
    tipo = tipo.capitalize()
    if (tipo != 'X'):
      monto = int(input('Ingrese el monto: '))
      movimientos.append((tipo, monto))
  print(f'movimientos: {movimientos}')
  return movimientos

historial_movimientos()