% Armand Nasseri - 912679383

/* Exercise 1: */

% 1
Properties of p, b, m : consonantic, continuant, anterior

% 2
Properties of ee, lambda: Mid, central

% 3
Properties of s, integral, cc:  coronal




/* Exercise 2: */

phones(p).
phones(t).
phones(k).
phones(i).
phones(ae).
phones(u).
phones(a).

cns(p).
cns(t).
cns(k).

vowel(X) :-
    phones(X),
    not(cns(X)).



syllable(Syllable) :-
    onset(Onset),
    rime(Rime),
    append(Onset, Rime, Syllable).

onset([Onset]) :-     % anything that is a consanant
    phones(Onset), cns(Onset).

rime(Rime) :-
    nucleus(Nucleus),
    coda(Coda),
    append(Nucleus, Coda, Rime).

% A nucleus is always just a vowel
nucleus([Nucleus]) :-
    vowel(Nucleus).   % want it to come out as a list and not an atom

coda([Coda]) :-
    phones(Coda).

coda([]).

onset([]).






