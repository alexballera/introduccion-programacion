# Ej 1
super1 = [("leche",151.0),("yerba",4719.5),("jabón",269.2)]
super2 = [("leche",261.2),("yerba",3939.1),("jabón",319.2)]

def mejores_precios(super1: list[(str, int)], super2: list[(str, int)]) -> list[(str, int)]:
  res = []
  for i in range(0, len(super1)):
    if(super1[i][1] < super2[i][1]):
      res.append((super1[i][0], super1[i][1]))
    else:
      res.append((super2[i][0], super2[i][1]))
  """ contador = 0
  for producto in super1:
    if (producto[1] > super2[contador][1]):
      producto = (producto[0], super2[contador][1])
      res.append(producto)
    else:
      producto = producto[0], producto[1]
      res.append(producto)
    contador += 1 """
  return res

mejores_precios(super1, super2)

