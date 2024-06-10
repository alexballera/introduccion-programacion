##* Diccionarios
nombre_archivo = 'himno.txt'
#*Ejercicio 19
def agrupar_por_longitud(nombre_archivo:str)->dict:
    archivo=open(nombre_archivo,'r',encoding='utf8')
    res:dict[int]={}
    lineas=archivo.readlines()
    for linea in lineas:
        palabras=linea.split()
        for palabra in palabras:
            longitud=len(palabra)
            if longitud in res:
                res[longitud]+=1
            else:
                res[longitud]=1
    archivo.close()
    return res

# agrupar_por_longitud(nombre_archivo)

#*Ejercicio 21
def frecuencias(nombre_archivo:str)->dict:
    archivo = open(nombre_archivo, "r",encoding='utf8')
    lineas=archivo.readlines()
    frec: dict = {}

    for linea in lineas:
        palabras=linea.split()
        for palabra in palabras:
            if palabra not in frec:
                frec[palabra]=1
            else:
                frec[palabra]+=1
    
    archivo.close()
    return frec

frecuencias(nombre_archivo)