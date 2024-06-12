# Ej 1
def contar_lineas(nombre_archivo: str) -> int:
  archivo = open(nombre_archivo, 'r', encoding="utf-8")
  contador: int = 0
  for linea in archivo:
    contador += 1
    print(linea, end='')
  archivo.close()
  return contador

# contar_lineas('himno.txt')

# Ej 2
def existe_palabra(palabra: str, nombre_archivo: str) -> bool:
  archivo = open(nombre_archivo, 'r', encoding='utf-8')
  for linea in archivo:
    if palabra in linea:
      return True
  archivo.close()
  return False

# existe_palabra('hola', 'ahijado.txt')

# Ej 3
def cantidad_apariciones(nombre_archivo: str, palabra: str) -> int:
  archivo = open(nombre_archivo, 'r', encoding='utf-8')
  archivoRead = archivo.read()
  palabras = archivoRead.split()
  contador: int = 0
  for string in palabras:
    if(string == palabra):
      contador += 1
  archivo.close()
  return contador

cantidad_apariciones('ahijado.txt', 'ahijado')
