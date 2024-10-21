%-----------------------------------------------------------------------------------------

%-- ASKHSH 1

%ipologizei to athrisma mexri na ginei megalitero tou X 
inner_p(X,A,S,I,N) :- S >= X, N=I.
inner_p(X,A,S,I,N) :- S < X, 
                      I1 is (I+1),
                      S1 is (S+1-A/I1),
                      inner_p(X,A,S1,I1,N).
                    

p(X,A,N) :- S is (1-A), inner_p(X,A,S,1,N).


%-----------------------------------------------------------------------------------------

%-- ASKHSH 2

%ipologizeii to mikos tis listas
listLength([], 0).
listLength([_|T], Length) :-
    listLength(T, tLength),
    Length is tLength + 1.


%afairei ta stoixeia prin to position pou tou dinoumai 
removeBefore(0, List, List).
removeBefore(Position, [_|T], Result) :-
    Position > 0,
    NewPosition is Position - 1,
    removeBefore(NewPosition, T, Result).


%afairei ta stoixeia meta to position pou tou dinoumai
removeAfter(_, [], []).
removeAfter(0, [Element|_], [Element]).
removeAfter(Position, [X|T], [X|Result]) :-
    Position > 0,
    NewPosition is Position - 1,
    removeAfter(NewPosition, T, Result).



%i sinartisi kanei tous ipologismous tou telikou programatos 
fromList(_, I, J, S) :- I < 0, J < 0, S=[].
fromList(L, I, J, S) :- length(L, Length), I > Length, S=[].
fromList(_, I, J, S) :- I > J,S=[].
fromList(L,I,J,S):- I<0 ,
    J1 is J-1,
    removeAfter(J1,L,S).
fromList(L, I, J, S) :-
    I1 is I - 1,
    J1 is J - 1,
    removeAfter(J1, L, After),
    removeBefore(I1, After, S).

%elenxei an ta orismata I,J einai arithmoi kai kalei thn fromList
fromTo(L, I, J, S) :-number(I),
    number(J),
    fromList(L,I,J,S).



