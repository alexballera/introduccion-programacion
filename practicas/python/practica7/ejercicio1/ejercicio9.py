word = 'palebrabreri'

def tresVocalesDistintas(word: str) -> bool:
  contadorA: int = 0
  contadorE: int = 0
  contadorI: int = 0
  contadorO: int = 0
  contadorU: int = 0
  totalVocales: int = 0
  for letra in word:
    if(letra == 'a' or letra == 'A'):
      contadorA += 1
    if(letra == 'e' or letra == 'E'):
      contadorE += 1
    if(letra == 'i' or letra == 'I'):
      contadorI += 1
    if(letra == 'o' or letra == 'O'):
      contadorO += 1
    if(letra == 'u' or letra == 'U'):
      contadorU += 1
  if(contadorA > 0):
    totalVocales = totalVocales + 1
  if(contadorE > 0):
    totalVocales = totalVocales + 1
  if(contadorI > 0):
    totalVocales = totalVocales + 1
  if(contadorO > 0):
    totalVocales = totalVocales + 1
  if(contadorU > 0):
    totalVocales = totalVocales + 1
  return totalVocales > 2

tresVocalesDistintas(word)