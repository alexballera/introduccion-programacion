# Ej 2

def clonar_sin_comentarios(nombre_archivo: str):
  archivo = open(nombre_archivo, 'r', encoding="utf-8")
  archivo_sincomentarios = open('ahijado_sin_comentarios.txt', 'w', encoding="utf-8")
  for linea in archivo:
    if (not es_comentario(linea)):
      print(linea, end='')
      archivo_sincomentarios.writelines(linea)
  archivo.close()
  archivo_sincomentarios.close()
  return archivo_sincomentarios

def es_comentario(linea: str) -> bool:
    res: bool = False
    es_el_primero = True

    for char in linea:
        if char == "#" and es_el_primero:
            res = True
        elif char != " ":
            es_el_primero = False

    return res

clonar_sin_comentarios('ahijado.txt')