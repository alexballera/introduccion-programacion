# Ej 5

def agregar_frase_al_principio(nombre_archivo: str, frase : str):
  archivo = open(nombre_archivo, 'r+', encoding='utf-8')
  archivo_nuevo = archivo.readlines()
  archivo_nuevo.insert(0, frase + '\n')
  archivo.close()

  archivo = open(nombre_archivo, 'w', encoding='utf-8')
  archivo.truncate()
  for linea in archivo_nuevo:
    archivo.write(linea)

def agregar_frase_al_principio2(nombre_archivo: str, frase : str):
  archivo = open(nombre_archivo, 'r+', encoding='utf-8')
  contenido = archivo.read()
  archivo.seek(0)
  archivo.write(frase + '\n' + contenido)
  archivo.close()

archivo = 'himno.txt'
frase = 'Esta es la frase agregada al principio'
agregar_frase_al_principio(archivo, frase)