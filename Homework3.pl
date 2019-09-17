% Armand Nasseri - 912679383
:- ['properties.pl'].
:- ['entailment.pl'].
/* Exercise 1 */

/* 1
It is circumfixation.
*/

/* 2 */
germanic([b,e,e,n], stem).
germanic([b,e,r,g], stem).
germanic([s,t,e,e,n], stem).
germanic([d,i,e,r], stem).
germanic([[g, e], [t,e]], [affix, participle]).

germanic(B, participle) :-                  
    germanic(A, stem),                      % grab word from list
    germanic([X, Y], [affix, participle]),  % grab ge & te from list
    append([X,A,Y],B).                      % append ge word te to new word

/* Exercise 3 */


cspanish([m,o,m,e,n,t], [stem]).
cspanish([p,o,k], [stem]).

% Underspecify the morphemes (aspiration)
% Make the phone diff its one or the other at the end homorganic rule

% Masculine suffix -o
 cspanish([P1], [suffix, masculine]) :-
     phone(P1), not(cns(P1)), bck(P1), mid(P1).

% Suffix -t or k for P1
 cspanish([i,P1], [suffix,diminutive]) :-
    phone(P1), cns(P1), not(cnt(P1)), not(voi(P1)),     
        not(sib(P1)), not(lab(P1)).


% last phone of suffix and last phone of the stem cant match
% phone comparison, look at nasal assimilation program to make it work
% try not(homorganic)
% have it in suffixing predicate not homorganic to make features not match


cspanish(A,[noun, masculine]):-

	cspanish(B,[stem]),                 % grabs moment
	cspanish(C,[suffix, masculine]),     % grabs o
    append(B,C,A).                      % appends moment to o   



homorganic(A, B) :-
    alv(A) <=> alv(B),
    vel(A) <=> vel(B).


cspanish(A,[stem]):-               
    cspanish(B,[stem]),                         
	cspanish(C,[suffix, diminutive]),      
    last(C, LastPhoneOfSuffix),
    last(B, LastPhoneOfStem),             
    not(homorganic(LastPhoneOfStem, LastPhoneOfSuffix)),
    append(B,C,A).

