palabra: str = 'esternocleidomastoideo'

def esVocal(letra: str) -> bool:
  return (letra == 'a' or letra == 'e' or letra == 'i' or letra == 'o' or letra == 'u')

def quita_vocales(word: str) -> str:
  sin_vocales = ''
  for i in range(0, len(word), 1):
    if not (esVocal(word[i])):
      sin_vocales += word[i]
  return sin_vocales

quita_vocales(palabra)