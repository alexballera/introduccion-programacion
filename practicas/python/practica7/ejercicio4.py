import random
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

# historial_movimientos()

def random_number() -> int:
  num: int = 8
  while(num == 8 or num == 9):
    num = random.randint(1,12)
  return num

def seleccione_carta() -> list[int]:
  cartas: list[int] = []
  carta: int = 0
  suma: int = 0
  jugar = input('\nDesea iniciar el juego? Si o No?: ').capitalize()
  while (jugar == 'Si'):
    if (jugar == 'Si'):
      carta = random_number()
      print(f'\nSu carta es número {carta}')
      cartas.append(carta)
      if (carta >= 10):
        suma = suma + 0.5
        if ( suma > 7.5):
         print(f'Perdiste! \nResultado = {suma} \nCartas = {cartas}')
         jugar = 'No'
         return cartas
        if ( suma == 7.5):
         print('Ganaste!')
         jugar = 'No'
         print(cartas)
         return cartas
      else:
        suma = suma + carta
        if ( suma > 7.5):
         print(f'Perdiste! \nResultado = {suma} \nCartas = {cartas}')
         jugar = 'No'
         return cartas
        if ( suma == 7.5):
         print('Ganaste!')
         print(cartas)
         jugar = 'No'
         return cartas
      jugar = input(f'Resultado = {suma}, \nDesea seguir sacando otra carta? Si o No?: ').capitalize()
  print(f'\nDecidiste no seguir jugando, \nresultado: {suma} \nCartas jugadas: {cartas}')
  return cartas

seleccione_carta()