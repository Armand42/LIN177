:- ['properties.pl'].
% page 346 for chart
% copy the other 2 files to make program run because phone is redefined

% additions to properties
phone(th).
phone(ph).
phone(kh).

cns(th).
cns(ph).
cns(kh).

asp(th).
asp(ph).
asp(kh).

alv(th).
lab(ph).
vel(kh).





% top          each phone corresponds to a natural class
underenglish([P1,P2,P3], [word]) :-
    phone(P1), cns(P1), not(cnt(P1)), not(voi(P1)), not(sib(P1)), alv(P1),
    phone(P2), not(cns(P2)), bck(P2), low(P2),
    phone(P3), cns(P3), not(cnt(P3)), not(voi(P3)), not(sib(P3)), lab(P3), not(asp(P3)).

% stop
underenglish([s,P2,P3,P4], [word]) :-
    phone(P2), cns(P2), not(cnt(P2)), not(voi(P2)), not(sib(P2)), alv(P2),
    phone(P3), not(cns(P3)), bck(P3), low(P3),
    phone(P4), cns(P4), not(cnt(P4)), not(voi(P4)), not(sib(P4)), lab(P4), not(asp(P4)).


% pat
underenglish([P1, ae, t], [word]) :-
    phone(P1), cns(P1), not(cnt(P1)), not(voi(P1)),
        not(sib(P1)), lab(P1).

% spat
underenglish([s,P2, ae, t], [word]) :-
    phone(P2), cns(P2), not(cnt(P2)), not(voi(P2)),
        not(sib(P2)), lab(P2).

% cop
underenglish([P1,a,p], [word]) :-
    phone(P1), cns(P1), not(cnt(P1)), not(voi(P1)),
        not(sib(P1)), vel(P1).



english(Word, [word]) :-
    phone(Phone), cns(Phone), not(cnt(Phone)), not(voi(Phone)),
        not(sib(Phone)),

        Word = [Phone|_],
        underenglish(Word, [word]),
        asp(Phone).

english(Word, [word]) :-
    underenglish(Word, [word]),
        Word = [Phone|Tail],
        Tail = [SecondPhone|_],
        phone(SecondPhone), cns(SecondPhone), not(cnt(SecondPhone)), not(voi(SecondPhone)),
        not(sib(SecondPhone)), 

        not(asp(SecondPhone)).

