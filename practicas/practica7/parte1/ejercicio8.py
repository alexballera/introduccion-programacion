movimientos = [('I', 2000), ('R', 20),('R', 1000),('I', 300)]

def getSaldo(movimientos: list[(str, int)]) -> int:
  saldo: int = 0
  for movimiento in movimientos:
    tipo: str = movimiento[0]
    cantidad: int = movimiento[1]
    if(tipo == 'I'):
      saldo += cantidad
    elif(tipo == 'R'):
      saldo -= cantidad
  return saldo

getSaldo(movimientos)