-----------------------------------------------------------------------------------------

-- ASKHSH 1

distance ::  (Double,Double)->(Double,Double)->Double
distance (x1,y1) (x2,y2) = sqrt((x1-x2)^2 + (y1-y2)^2)


area :: (Double,Double)->(Double,Double)->(Double,Double)->Double
area (x1,y1) (x2,y2) (x3,y3) = sqrt(t  *(t  - a)*(t  - b)*(t  - c))
                            where 
                                t = ( a + b + c ) /2 
                                a = distance (x1,y1) (x2,y2)
                                b = distance (x2,y2) (x3,y3)
                                c = distance (x3,y3) (x1,y1)
                                
                                 




-----------------------------------------------------------------------------------------
     
-- ASKHSH 2

minutes::(Int,Int)->(Int,Int)->Int     
minutes (h1,m1) (h2,m2) =  (h2-h1)*60 + (m2-m1) 

time ::(Int,Int)->(Int,Int)->Int   
time (h1,m1) (h2,m2) 
                |mod m 60 ==0 
                    = div m  60 
                |otherwise 
                    = div m 60  + 1
                where 
                    m = minutes (h1,m1) (h2,m2)
                        

parking :: (Int,Int)->(Int,Int)->Int            
  
parking (h1,m1) (h2,m2) |t <= 3
                            =8
                        |t <=6 
                            =8 + (t-3)*2
                        |otherwise
                            = 14 + (t-6)*1
                        where 
                            t = time (h1,m1) (h2,m2)




insterInt :: Int -> [Int] -> [Int]
insterInt n (h:t) 
                | n<=h 
                    = n : (h : t) 
                | otherwise
                    = h : insterInt n t
insterInt n [] = [n] 




