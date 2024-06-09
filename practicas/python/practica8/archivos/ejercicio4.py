def agregar_frase_al_final(nombre_archivo: str,frase : str):
  archivo = open(nombre_archivo, 'r', encoding='utf-8')
  archivo = archivo.readlines()
  archivo_nuevo = []
  
  for linea in archivo:
    archivo_nuevo.append(linea)
  
  archivo_nuevo.append('\n')
  archivo_nuevo.append(frase)
  
  archivo.clear()
  archivo = open(nombre_archivo, 'w', encoding='utf-8')
  
  for linea in archivo_nuevo:
    archivo.write(linea)

# Mejorado con la documentación
# https://recursospython.com/guias-y-manuales/lectura-y-escritura-de-archivos/

def agregar_frase_al_final2(nombre_archivo: str,frase : str):
  archivo = open(nombre_archivo, '+a', encoding='utf-8')
  archivo.write(frase)
  archivo.close()

archivo = 'himno.txt'
frase = '\nEsta es la frase agregada al final'
agregar_frase_al_final2(archivo, frase)
