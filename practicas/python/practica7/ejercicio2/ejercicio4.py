palabra: str = 'esternocleidomastoideo'

def esVocal(letra: str) -> bool:
  return (letra == 'a' or letra == 'e' or letra == 'i' or letra == 'o' or letra == 'u')

def reemplaza_vocales(word: str) -> str:
  palabraNueva: str = ''
  for letra in word:
    if (esVocal(letra)):
      palabraNueva += '-'
    else:
      palabraNueva += letra
  return palabraNueva

reemplaza_vocales(palabra)