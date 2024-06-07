palabra: str = 'esternocleidomastoideo'

def quita_vocales(word: str) -> str:
  sin_vocales = ''
  for i in range(0, len(word), 1):
    if not (word[i] == 'a' or word[i] == 'e' or word[i] == 'i' or word[i] == 'o' or word[i] == 'u'):
      sin_vocales += word[i]
  return sin_vocales

quita_vocales(palabra)