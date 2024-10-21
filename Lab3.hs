-----------------------------------------------------------------------------------------

-- ASKHSH 1
--ipologismos tis diaforas kata apoliti timi 
difference :: Int->Int->Int
difference a b  = abs (a - b)

--ipologismos tis apolitis timis tis diafotas tou stoixeiou me ta stoixeia tis listas
calculateDifferenceLst :: Int->[Int]->[Int]->[Int]
calculateDifferenceLst a (h:t) lst = calculateDifferenceLst a t (lst ++ [difference a h])
calculateDifferenceLst a [] lst = lst

--aplopoiisi tis parapano sinartisis
differenceLst ::Int->[Int]->[Int]
differenceLst a (h:t) = calculateDifferenceLst a (h:t) []

--euresi tou mikroterou stoixeiou tis listas
minIntList :: [Int]->Int 
minIntList (h:[]) = h
minIntList (h:t) = min h (minIntList t)

--euresi thesis enos stoixeiou mesa sti lista 
find__position ::[Int]->Int->Int->Int
find__position (h:t) n d
                |n == h
                    = d
                |otherwise
                    = find__position t n (d+1)
find__position [] n d = 1

--aplopoiisi tis parapano sinartisis 
position :: [Int]->Int->Int
position lst n = find__position lst n 1
                    

nearest :: [Int]->Int->Int
nearest s n = position dif (minIntList (dif))
            where 
                dif = differenceLst n s


  


-----------------------------------------------------------------------------------------
     
-- ASKHSH 2
 
--xorizei ena string se duo meri ena me mikos d kai to ipoloipo
split_at :: Int->String->(String, String)
split_at d (h:t)
        | d>0
            = (h : first, second)
        | otherwise
            = ("", s)
            where 
                s = h:t
                (first, second) = split_at (d-1) t
split_at d "" = ("", "")


replace :: String->String->String->String
replace a b w = switch w0 w1
    where
        len_a = length a

        (w0,w1) = split_at len_a w

        --kanei tin allagi ton stoixeiwn
        switch :: String -> String -> String
        switch s rst
            | s == a 
                = b ++ (switch s0 rst0)
            | length s < len_a
                = s
            | rst == ""
                = s
            | otherwise
                = (head s) : (switch z trst)
            where 
                (s0, rst0) = split_at len_a rst
                z = tail s ++ [head rst]
                trst = tail rst
        