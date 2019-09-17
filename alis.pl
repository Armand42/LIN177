:- ['entailment.pl'].

/*
-alis and -aris are two allomorphs of a nominalizing suffix of Latin.
mor and mol are two roots ("custom" and "wisdom tooth", respectively).

mor + aXis > moralis
mol + aXis > molaris
*/

liq(l).
liq(r).

lat(l).

latin([m,o,r],[noun]).
latin([m,o,l],[noun]).

latin([a,L,i,s],[affix]):-
	liq(L).

latin(A,[adjective]):-
	latin(B,[noun]),
	latin([a,L,i,s],[affix]),
	last(B,E),
	not(homorganic(E, L)),
	append(B,[a,L,i,s],A).

homorganic(A, B) :-
	lat(A) <=> lat(B).