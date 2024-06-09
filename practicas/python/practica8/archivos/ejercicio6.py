#*Ejercicio 6 (No termine de entenderlo)
def listar_palabras_de_archivo(nombre_archivo:str):
    archivo = open(nombre_archivo,'rb', encoding='utf-8')
    contenido = archivo.read()
    res: list[str] = []
    for linea in contenido:
      caracter: str=chr(linea)
      if (caracter > 'A' and caracter < 'Z') or (caracter > 'a' and caracter < 'z') or (caracter == ' ') or (caracter == '_'):
        res.append(chr(linea))
    archivo.close()
    print(res)

archivo = 'himno.txt'
listar_palabras_de_archivo(archivo)