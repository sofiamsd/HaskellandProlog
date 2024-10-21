-----------------------------------------------------------------------------------------

-- ASKHSH 1
-- euresh tou teleutaiou psifiou enos arithmou 
lastdigit :: Integer -> Integer
lastdigit n =  mod n 10

-- kratame ton arithmo ektos tou teleutaiou psifiou
frontpart :: Integer -> Integer
frontpart z = div z 10

-- epanenwsh twn psifiwn tou arithmou
combine :: Integer -> Integer -> Integer 
combine z n =  z * 10 + n  

-- ipologismos tis sinartisis pou dinetai sthn ekfwnisi
calculate :: Integer -> Integer -> Integer
calculate a b = mod (13 * (lastdigit a +5 )+ 19 * (lastdigit b + 3)) 10

-- ektelesi tis sinartisis join alla mono gia thetikous arithmous
pjoin :: Integer->Integer->Integer
pjoin 0 0 = 0
pjoin a b = pjoin (frontpart a )(frontpart b) `combine` calculate a b 

join :: Integer->Integer->Integer
join a b = pjoin (abs a) (abs b) 




-----------------------------------------------------------------------------------------
     
-- ASKHSH 2
-- euklidia methodos gia thn euresh megistou koinou diaireth (dinetai stis diafanies tou mathimatos)
gcdE :: Int->Int->Int
gcdE 0 b = b 
gcdE a b  
            |a<b 
                = gcdE (b-a) a
            |otherwise 
               = gcdE (a-b) b

-- euresh arithmon pou diairoun akeraia ton zitoumeno arithmo
findDivisors :: Int -> Int-> [Int] ->[Int]
findDivisors n d lst 
                    | d>n 
                        = lst
                    | mod n d == 0
                        = findDivisors n (d+1) (d:lst)
                    |otherwise
                        = findDivisors n (d+1) lst
                     
-- aplopoihsh ths parapanw sinartisis 
divisors :: Int  -> [Int]
divisors n = findDivisors n 1 []

-- euresh stoixeiou sth thesi pou zitame 
position :: Int -> [Int] -> Int
position n (h:t)
                |n == 0
                    = h
                |otherwise
                    = position (n-1)  t 
position n [] = 0


kgcd :: Int->Int->Int->Int
kgcd m n k = position (k-1) (divisors (gcdE m n))





