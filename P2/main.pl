/*
Insereaza un element intr-o lista ordonata pastrand o forma ordonata
insert(N: int, L: lista, R: lista)
N: nr de inserat in L
L: lista in care trebuie inserat N
R: lista L cu elementul N inserat
model de flux: (i, i, o)/(i,i,i) determinist
*/
insert(A, [], [A]):-!.

insert(A, [H|T], [A,H|T]):-
    A < H, 
    !.

insert(A, [A|T], [A|T]):-!.

insert(A, [H|T], [H|R]):-
    insert(A, T, R).

/*
Sorteaza prin metoda Insertion Sort avand grija sa nu pastreze dublicatele
insertionSort(L: lista, R: lista)
L: lista care trebuie sortata in R
R: lista L sortata
model de flux: (i, o)/(i,i) determinist
*/
insertionSort([], []):-!.

insertionSort([H|T], R):-
    insertionSort(T, Sorted),
    insert(H, Sorted, R).


/*
Primeste o lista de numere si alte liste si sorteaza fara sa pastreze dublurile elementele lista din lista principala
fb(L: lista, R:lista)
L: lista originala 
R: lista L in care s-au si sortat sublistele
model de flux: (i,o)/(i,i) determinist
*/

fb([], []).

fb([[H|H2]|T], [R1|R2]):-
    insertionSort([H|H2], R1), 
    fb(T, R2), !.

fb([H|T], [H|R]):-
    fb(T, R).