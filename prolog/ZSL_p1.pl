/*
Insereaza din M in M pozitii o valoare data
adaugM(L: lista, M: int, NR: int, COPIEM: int, R: list)
L: lista initiala in care se insereaza NR din M in M 
M: numarul NR se insereaza din M in M pozitii
NR: numarul de inserat in L din M in M pozitii
COPIEM: copie facuta numarului M sa nu fie pierdut
R: lista in care sa inserat NR in lista L din M in M pozitii
model de flux: (i,i,i,i,o)/(i,i,i,i,i) - determinist
*/
adaugM([H], M, NR, _, [H,NR]):-
    M > 1, !.

adaugM([H|T], M, NR, COPIEM, [H|R]):-
    M > 1,
    M1 is M-1,
    adaugM(T, M1, NR, COPIEM, R).

adaugM([H|T], 1, NR, COPIEM, [NR|R]):-
    adaugM([H|T], COPIEM, NR, COPIEM, R).

/*
Insereaza din M in M pozitii o valoare data apeland adaugM si afiseaza rezultatul
adaugM(L: lista, M: int, NR: int, R: list)
L: lista initiala in care se insereaza NR din M in M 
M: numarul NR se insereaza din M in M pozitii
NR: numarul de inserat in L din M in M pozitii
R: lista in care sa inserat NR in lista L din M in M pozitii
model de flux: (i,i,i,o)/(i,i,i,i) - determinist
*/
f(L, M, NR, R):-
    adaugM(L, M, NR, M, R),
    write(R).

/*
model matematic

adaugM(l1...ln, m, nr, copie){
    [l1], n = 1 and m > 1
    [nr] , n = 0 and m = 1
    nr U adaugM(l1...ln, copie, nr, copie), m = 1 and n>1
    l1 U adaugM(l2...ln, m-1, nr, copie), m > 1 and n>1
}

f(l1...ln, m, nr) = adaugM(l1...ln, m, nr, m)


*/