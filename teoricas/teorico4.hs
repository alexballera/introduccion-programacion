maximo :: Int -> Int -> Int
maximo n m
 | n >= m = n
 | otherwise = m

maximo3a :: Int -> Int
maximo3a n
 | n >= 3 = n
 | otherwise = 3

maximo3b :: Int -> Int
maximo3b n = maximo n 3

maximo3c :: Int -> Int
maximo3c = maximo 3


sumaDivisoresA :: Int -> Int
sumaDivisoresA n = sumaDivisoresHasta n n

-- Desde n hasta 1
sumaDivisoresHasta :: Int -> Int -> Int
sumaDivisoresHasta _ 1 = 1
sumaDivisoresHasta n k
 | mod n k == 0 = k + sumaDivisoresHasta n (k - 1)
 | otherwise = sumaDivisoresHasta n (k - 1)

sumaDivisoresB :: Int -> Int
sumaDivisoresB n = sumaDivisoresDesde n n

-- Desde n hasta 1
sumaDivisoresDesde :: Int -> Int -> Int
sumaDivisoresDesde 1 _ = 1
sumaDivisoresDesde n k
 | mod n k == 0 = k + sumaDivisoresDesde (k + 1) n
 | otherwise = sumaDivisoresDesde (k + 1) n