/*
Check if two arrays have the same elements
in: M1 : list of int
in: M2 : list of int
returns : true if arrays have the same elements, 
          false otherwise
model fe flux (i,i)
*/
testEquality(M1, M2):-
    /* If M1 and M2 have different length they arent equal*/ 
    length(M1, A),
    length(M2, B),
    A==B,
    /* Sort the arrays to check equality for every element*/
    nsort(M1, L1),
    nsort(M2, L2),
    isEqual(L1, L2, A).

/*
Verifies if the first element from 2 arrays are equal
in: A|L1 (array of int): first array
in: B|L2 (array of int): second array
in: N (int):length of the arrays
returns: true if we got to the end
         false if found different head values
model de flux (i,i,i)/(i,i,o)
*/

isEqual([],[],0):-!.

isEqual([A|L1],[B|L2], N):-
    /*Decrement length by 1*/
    N1 is N-1,
    /*Verify the equality of the arrays heads*/
    A==B,
    /*Continue with the sub-array without the heads*/
    select(L1,L2, N1).

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