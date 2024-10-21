%-----------------------------------------------------------------------------------------

%-- ASKHSH 1

% ypologismos tou armonikoy mesou orou
harmonicGrade(A,B,C,M) :- M is 3/(1/A+1/B+1/C).

% mesos oros tou armonikou M kai telikou E
mesosOros(M,E,H):- H is (M+E)/2.

% ypologismos bonus 
bonus(M,W):- M>=9 ,W is 10.
bonus(M,W):- M<9 , W is M*1.2 . 

% elenxos an ta labs einai mirkotera tou 5 
lab(A,B,C,L):- (A>=5,B>=5,C>=5) ,
                L is 5 .

% elenxos an kapoia metabliti einai <1 h >10 
zero(A,B,C,E,Z):-A>=1,A=<10,
                 B>=1,B=<10,
                 C>=1,C=<10,
                 E>=1,E=<10,
                 Z is 1.



% teliki batmologia (xvris elenxo <1 h >10 h lab <5) 
telikos(M,L,E,G):-L>=5 , M>E ,mesosOros(E,M,H),bonus(H,G).
telikos(M,L,E,G):-L<5 , M>E , mesosOros(E,M,G).
telikos(M,L,E,G):-L>=5 , M=<E ,bonus(E,G) .
telikos(M,L,E,G):-L<5 , M=<E , G is E.

% teliki batmologia me elenxo 
grade(A,B,C,E,G):- zero(A,B,C,E,Z) , G is 0.
grade(A,B,C,E,G):- lab(A,B,C,L),harmonicGrade(A,B,C,M),telikos(M,L,E,G) . 



%-----------------------------------------------------------------------------------------

%-- ASKHSH 2

% ypologismos tou z gia tis diafores parametrous
zeta(K,N,X,Y,G) :- (K=:=0;N<K),G is (Y+K);
                Y<K , N=:=K ,G is X ;
                Y<K , N is (K+1),G is (N-2);
                Y<K , N >= (K+2),G is K.
zeta(K,N,X,Y,G) :- Y>=K, 
                   N>=K,
                   K>=1,
                   Y1 is (Y-K),
                   zeta(K,N,X,Y1,G1),
                   N1 is (N-K),
                   zeta(K,N1,X,G1,G).
                   








