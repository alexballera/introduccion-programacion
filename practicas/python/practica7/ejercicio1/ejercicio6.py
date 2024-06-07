palabra: str = 'oxxo'

def esPalindromo(word:str)->bool:
  for i in range(0, len(word), 1):
    if(word[i] != word[(len(word) - 1) - i]):
      print(f'{word} no es palindromo')
      return False
  print(f'{word} es palindromo')
  return True


esPalindromo(palabra)