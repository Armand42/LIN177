/*
Output examples of syllable.pl
?- phone(X), cns(X), not(nas(X)).
X = p ;
X = b ;
X = t ;
X = d ;
X = k ;
X = g ;
X = f ;
X = v ;
X = θ ;
X = ð ;
X = s ;
X = z ;
X = ʃ ;
X = ʒ ;
X = č ;
X = ǰ ;
X = l ;
X = ɹ ;
X = j ;
X = w ;
X = h ;
false.

?- cns(X).
X = p ;
X = b ;
X = m ;
X = t ;
X = d ;
X = n ;
X = k ;
X = g ;
X = ŋ ;
X = f ;
X = v ;
X = θ ;
X = ð ;
X = s ;
X = z ;
X = ʃ ;
X = ʒ ;
X = č ;
X = ǰ ;
X = l ;
X = ɹ ;
X = j ;
X = w ;
X = h.

?- not(cns(X)).
false.

?- phone(X), not(cns(X)).
X = i ;
X = ɪ ;
X = e ;
X = æ ;
X = u ;
X = ʊ ;
X = o ;
X = a ;
X = ə ;
X = ʌ.

?- [a,b,c] = [A|B].
A = a,
B = [b, c].

?- [a,b,c,d,e,f,g] = [A|B].
A = a,
B = [b, c, d, e, f, g].

?- [a] = [A|B].
A = a,
B = [].

?- [] = [A|B].
false.

?- [[a,b,c],[d,e,f]] = [A|B].
A = [a, b, c],
B = [[d, e, f]].





length of first argument is bound to variable Z
counts items and returns it in Z

findall(X,syllable(X), Y), length(Y,Z).
 
syllable(X,Y).
X = [i],
Y = 1 ;
X = [ɪ],
Y = 1 ;
X = [e],
Y = 1 ;
X = [æ],
Y = 1 ;
X = [u],
Y = 1 ;
X = [ʊ],
Y = 1 ;
X = [o],
Y = 1 ;
X = [a],
Y = 1 ;
X = [ə],
Y = 1 ;
X = [ʌ],
Y = 1 ;
X = [p, i],
Y = 2 ;
X = [p, ɪ],
Y = 2 ;
X = [p, e],

?- syllable(X,4).
X = [p, e, j, p] ;
X = [p, e, j, b] ;
X = [p, e, j, t] ;
X = [p, e, j, d] ;
X = [p, e, j, k] ;
X = [p, e, j, g] 




*/

% Homework 1 example - Do all in 1 file
/*
Inventory of hypothetical language
consonants: p,b,m,n,t,d   vowels: ae,i,u         GIVEN DATA facts

cv
v
cvn - nasal

Need to rewrite the phone properties and syllables.
*/

% "phone.pl"

phone(p).
phone(b).
phone(m).
phone(n).
phone(t).
phone(d).
phone(i).
phone(u).
phone(ae).

% "properties.pl"
% what features are useful for us for restrictions?

% Want first set of phones to be consonants
cns(p).
cns(b).
cns(m).
cns(n).
cns(t).
cns(d).

% vow(i) - don't do this, don't want two things, logic
% of being vowel is just not a consonant

vow(X) :-
    phone(X), not(cns(X)).

% So what is a nasal? Need information
% We only need to redefine what is necessary

nas(n).
nas(m).

% "syllable.pl"
syllable(Syllable) :-
    onset(Onset),
    rime(Rime),
    append(Onset, Rime, Syllable).


rime(Rime) :-
    nucleus(Nucleus),
    coda(Coda),
    append(Nucleus, Coda, Rime).

% A nucleus is always just a vowel
nuclues([Nucleus]) :-
    vow(Nucleus).   % want it to come out as a list and not an atom

onset([Onset]) :-     % anything that is a consanant
    phone(Onset), cns(Onset).

coda([Coda]) :-
    phone(Coda), nas(Coda).

coda([]).

onset([]).

/* OUTPUT
?- coda(X).
X = [m] ;
X = [n] ;
X = [].

?- onset(X).
X = [p] ;
X = [b] ;
X = [m] ;
X = [n] ;
X = [t] ;
X = [d] ;
X = [].

?- nucleus(X).
X = [i] ;
X = [u] ;
X = [ae] ;
false.

?- syllabl(X).
Correct to: "syllable(X)"? 
Please answer 'y' or 'n'? yes
X = [p, i, m] ;
X = [p, i, n] ;
X = [p, i] ;
X = [p, u, m] ;
X = [p, u, n] ;
X = [p, u] ;
X = [p, ae, m] ;
X = [p, ae, n] ;
X = [p, ae] ;
X = [b, i, m] ;
X = [b, i, n] ;
X = [b, i] ;
X = [b, u, m] ;
X = [b, u, n] ;
X = [b, u] ;
X = [b, ae, m] ;
X = [b, ae, n] ;
X = [b, ae] ;
X = [m, i, m] ;
X = [m, i, n] ;
X = [m, i] ;
X = [m, u, m] ;
X = [m, u, n] ;
X = [m, u] ;
X = [m, ae, m] ;
X = [m, ae, n] ;
X = [m, ae] ;
X = [n, i, m] ;
X = [n, i, n] ;
X = [n, i] ;
X = [n, u, m] ;
X = [n, u, n] ;
X = [n, u] ;
X = [n, ae, m] ;
X = [n, ae, n] ;
X = [n, ae] ;
X = [t, i, m] ;
X = [t, i, n] ;
X = [t, i] ;
X = [t, u, m] ;
X = [t, u, n] ;
X = [t, u] ;
X = [t, ae, m] ;
X = [t, ae, n] ;
X = [t, ae] ;
X = [d, i, m] ;
X = [d, i, n] ;
X = [d, i] ;
X = [d, u, m] ;
X = [d, u, n] ;
X = [d, u] ;
X = [d, ae, m] ;
X = [d, ae, n] ;
X = [d, ae] ;
X = [i, m] ;
X = [i, n] ;
X = [i] ;
X = [u, m] ;
X = [u, n] ;
X = [u] ;
X = [ae, m] ;
X = [ae, n] ;
X = [ae] ;
false.

?- findall(X,syllable(X), Y), length(Y,Z).
Y = [[p, i, m], [p, i, n], [p, i], [p, u, m], [p, u, n], [p, u], [p, ae, m], [p, ae, n], [p, ae], [b, i, m], [b, i, n], [b, i], [b, u, m], [b, u, n], [b, u], [b, ae, m], [b, ae, n], [b, ae], [m, i, m], [m, i, n], [m, i], [m, u, m], [m, u, n], [m, u], [m, ae, m], [m, ae, n], [m, ae], [n, i, m], [n, i, n], [n, i], [n, u, m], [n, u, n], [n, u], [n, ae, m], [n, ae, n], [n, ae], [t, i, m], [t, i, n], [t, i], [t, u, m], [t, u, n], [t, u], [t, ae, m], [t, ae, n], [t, ae], [d, i, m], [d, i, n], [d, i], [d, u, m], [d, u, n], [d, u], [d, ae, m], [d, ae, n], [d, ae], [i, m], [i, n], [i], [u, m], [u, n], [u], [ae, m], [ae, n], [ae]],
Z = 63.

all of the results in the list 


syllabe(X). 
will give you one syllable at a time

findall(findVariable, such that syllable(findVariable), result list to be placed Y)
length([a,b,c], X).
X = 3


*/