palabra: str = 'esternocleidomastoideo'

def pertenece(letra: str, palabra: str) -> bool:
    for i in range(0, len(palabra), 1):
        if (letra == palabra[i]):
            return True
    return False

def eliminar_repetidos(palabra: str) -> str:
    palabra_nueva: str = ''
    for i in range(0, len(palabra)):
        if(not pertenece(palabra[i], palabra_nueva)):
            palabra_nueva = palabra_nueva + palabra[i]
    return palabra_nueva

def eliminar_repetidos2(palabra: str) -> str:
    palabra_nueva: str = ''
    for i in range(0, len(palabra)):
        if not palabra[i] in palabra_nueva:
            palabra_nueva = palabra_nueva + palabra[i]
    return palabra_nueva

def eliminar_repetidos3(palabra: list[str]) -> list[str]:
    palabra_nueva: list[str] = []
    for i in range(0, len(palabra)):
        if (palabra[i] not in palabra_nueva):
            palabra_nueva.append(palabra[i])
    return palabra_nueva

eliminar_repetidos(palabra)