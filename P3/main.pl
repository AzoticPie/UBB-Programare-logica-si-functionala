/*
Determina toate subsirule strict crescatoare dintr-o lista
ascendant_lists(L:list, F:int, R:list)
L: lista originala in care se cauta subsirule crescatoare
F: flag ajutor cu valoarea 1 - daca am inceput deja construirea unui rezultat in R sau valoarea 0 - altfel
R: secventa de elemente strict crescatoare gasita in lista L
model de flux: (i,i,o) - nedeterminist
*/
ascendant_lists([L1|_], 1, [L1]).

ascendant_lists([_,L2|T], 0, R):-
    ascendant_lists([L2|T], 0, R).

ascendant_lists([L1,L2|T], _, [L1|R]):-
    L1 < L2,
    ascendant_lists([L2|T], 1, R).

/*
Apeleaza functia ascendant_lists ascunzand metoda flag-ului
f(L:list, R:list)
L: lista originala in care se cauta subsirule crescatoare
R: secventa de elemente strict crescatoare gasita in lista L
model de flux: (i,o)/(i,i) - nedeterminist
*/
f(L, R):- ascendant_lists(L, 0, R).