:- ['properties.pl'].
% Fix this
% suffix
underyaka([P1,P2,P3], [suffix]) :-
    phone(P2), cns(P2), voi(P2), alv(P2), not(pal(P2)), not(sib(P2)), snt(P2),          % l or n
    phone(P1), not(cns(P1)), not(bck(P1)), not(mid(P1)), hih(P1),   % i I
    P1 = P3.

% sil
underyaka([s,P2,P3], [root]) :-
    phone(P3), cns(P3), voi(P3), alv(P3),  not(nas(P3)), not(pal(P3)),
    not(sib(P3)), snt(P3) , not(nas(P3)),
    phone(P2), not(cns(P2)), not(bck(P2)), not(mid(P2)), hih(P2), not(tns(P2)).

% kim
underyaka([s,P2,P3], [root]) :-
    phone(P3), cns(P3), voi(P3), alv(P3),  not(nas(P3)), not(pal(P3)),
    not(sib(P3)), snt(P3) , not(nas(P3)), lab(P3),
    phone(P2), not(cns(P2)), not(bck(P2)), not(mid(P2)), hih(P2), not(tns(P2)).
    




