/*
Verifica daca doua multimi sunt egale
testsetp(S1: list, S2:list)
S1 - prima multime
S2 - a doua multime
model de flux: (i,i)
*/
testsetp(S1, S2):-
    mylength(S1, A),
    mylength(S2, B),
    A==B,
    testset(S1, S2).

/*
Verifica daca doua multimi cu aceeasi lungime sunt egale
testset(S1: list, S2:list)
S1 - prima multime
S2 - a doua multime
model de flux: (i,i)
*/
testset([], S).

testset([H|T], S2):-
    isinset(S2, H),
    testset(T, S2).

testset([H|_], S2):-
    not(isinset(S2, H)),
    false.
/*
Verifica daca un element se afla intr-o lista
isinset(L: list, E:int)
L - lista in care se cauta
E - elementul care se cauta
model de flux: (i,i)
*/
isinset([A|_], A).

isinset([_|T], A):-
    isinset(T, A).  

/*
Returneaza lungimea unei liste
testsetp(L: list, E:int)
L - lista in care se cauta lungimea
E - lungimea listei
model de flux: (i,i)/(i,o)
*/
mylength([],0):-!.
mylength([_|L],M):-
    mylength(L,M1),
    M=M1+1.

/*
Select the nth value from an array
in: L(array): the array 
in: N(int): the position of the element
out: P(int): the value of the element
returns: P if found, false if n is out of range
model de flux: (i,o,o)/(i,i,i)
*/
/*P gets the value of Head when N gets to 1*/
selectNth([H|_], 1, H):-!.

selectNth([_|T], N, P):-
    /*decrease N by 1 and search in the sub-array without the head*/
    N1 is N-1,
    selectNth(T, N1, P).