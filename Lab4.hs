-----------------------------------------------------------------------------------------

-- ASKHSH 1

generating :: (Int->Double)->Int->(Double->Double)
generating f k = g k 
    where
        --ipologismos athrismatos g pou dinetai sthn ekfonoso
        g :: Int->Double->Double
        g 0 z = f 0
        g i z = (f i) * (z^i) + (g (i-1) z)
   


-----------------------------------------------------------------------------------------
     
-- ASKHSH 2

--epistrefei to stoixeio i tis s 
mapping :: [u]->Int->(u->Int->v)->[v]
mapping (h:t) i f 
        | length (h:t) ==1
            = [f h i ]
        |otherwise
            = [f h i] ++ mapping t (i+1) f 


mapi :: [u]->(u->Int->v)->[v]

mapi s f 
        | length s <0
            =[]
        |otherwise 
           = mapping s 1 f 


