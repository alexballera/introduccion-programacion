from datetime import datetime, timedelta

hoy = datetime.now()
print('Hoy: ' + str(hoy))
print('Año ' + str(hoy.year))
print('Mes ' + str(hoy.month))
print('Hora ' + str(hoy.hour))
print('Minuto ' + str(hoy.minute))

un_dia = timedelta(days=1)
print(un_dia)
ayer = hoy - un_dia
print('Ayer: ' + str(ayer))

lista = [1,2,3,4,5,6,7,8,9, 10]
lista2 = [1,2,3,4,5,6,7,8,9, 10]
reverse = []
reverse2 = []

for i in range(len(lista)):
  reverse.append(lista.pop())

i = len(lista2)
while(i > 0):
  reverse2.append(lista2.pop())
  i -= 1

print(f'reverse {reverse}')
print(f'reverse2 {reverse2}')
