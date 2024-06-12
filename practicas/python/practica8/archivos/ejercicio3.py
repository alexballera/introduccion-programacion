def invertir_lineas(archivo_original: str, archivo_invertido: str):
  archivo = open(archivo_original, 'r', encoding='utf-8')
  lineas = archivo.readlines()
  reverse = []
  #? reverse = lineas[::-1] --->> hace lo mismo que el for de abajo!
  #? [::-1] se llama slicing: permite extraer una subcadena linea[inicio:fin:paso] [::-1] extrae todo de atras para adelante
  """ for i in range(0, len(lineas)):
    reverse.append(lineas[len(lineas) - i - 1]) """
  for linea in lineas:
    reverse.insert(0, linea) # añade un elemento en la posición que se indica.

  reverso = open(archivo_invertido, 'w', encoding='utf-8')
  reverso.truncate() #Borra todo el contenido de un archivo
  
  for linea in reverse:
    reverso.write(linea)

  reverso.close()
  archivo.close()

archivo_original = 'himno.txt'
archivo_invertido = 'reverso.txt'
invertir_lineas(archivo_original, archivo_invertido)