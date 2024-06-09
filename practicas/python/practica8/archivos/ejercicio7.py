def promedio_estudiante(nombre_archivo, lu : str) -> float:
  archivo = open(nombre_archivo, 'r', encoding='utf-8')
  contenido = archivo.readlines()
  notas: float = 0
  materias: int = 0
  
  for linea in contenido:
    datos = linea.split(",")
    if(datos[0] == lu):
      materias += 1
      notas += int(linea[3])
  
  promedio = notas / materias
  estudiante = []
  estudiante.append(lu, promedio)
  nuevo_archivo = open('nombre_archivo_promedios.csv', 'w', encoding='utf-8')
  nuevo_archivo.write(estudiante)
  archivo.close()
  nuevo_archivo.close()
  return promedio
