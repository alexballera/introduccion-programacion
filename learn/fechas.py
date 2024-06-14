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
