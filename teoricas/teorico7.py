def duplicar(valor: str, referencia: list):
  valor *= 2
  print("Dentro de la funcion duplicar: str: " + valor)
  referencia *= 2
  print("Dentro de la funcion duplicar: referencia: " + str(referencia))

x: str = 'abc'
y: list = ['a', 'b', 'c']
print('ANTES')
print('x:' + x)
print('x:' + str(y))
print('DESPUÉS')
duplicar(x, y)
print('x:' + x)
print('x:' + str(y))