s = [1,2,3]
def sumaTotal(lista: list) -> int:
    i: int = 0
    suma: int = 0
    while i < len(lista):
        suma += lista[i]
        i += 1
    return suma

suma = sumaTotal(s)
print(suma)

nombre = 'Alex'
apellido = 'Ballera'
# output = 'Hola ' + nombre + ' ' + apellido
# output = 'Hola, {} {}'.format(nombre, apellido)
# output = 'Hola, {1}, {0}'.format(nombre, apellido)
output = f'Hola, {nombre} {apellido}'
print(output)