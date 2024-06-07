palabra: str = 'esternocleidomastoideo'

def da_vuelta_str(word: str) -> str:
  nueva_palabra: str = ''
  for i in range(0, len(word), 1):
    nueva_palabra += word[len(word) - i - 1]
  return nueva_palabra

da_vuelta_str(palabra)