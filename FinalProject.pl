:- ['properties.pl'].
% French Prefixation

french([a], [affix,adjective], [without]).
french([a,n], [affix,adjective], [opposite]).

french([a,n,t,e], [affix,noun,adjective], [ante]).
french([a,n,t,i], [affix,noun,adjective], [anti]).
french([a,u,t,o], [affix,noun,adjective], [auto]).

french([b,e,n,e], [affix, noun, verb]).
french([b,i,e,n], [affix, noun, verb]).

french([c,o,n,t,r,a], [affix, noun]).
french([c,o,n,t,r,e], [affix, noun]).

french([d,e], [affix, verb]).
french([d,e,s], [affix, verb]).
french([d,i,s], [affix, verb]).

french([d,y,s], [noun, adjective]).

french([e,n], [affix, verb]).
french([e,m], [affix, verb]).

french([e,x], [affix, noun, adjective, verb]).
french([e,f], [affix, noun, adjective, verb]).
french([e], [affix, noun, adjective, verb]).

french([i,n], [affix,verb]).
french([i,m], [affix,verb]).

french([i,n], [affix, adjective], [in]).
french([i,m], [affix, adjective], [im]).
french([i,r], [affix, adjective], [ir]).
french([i,l], [affix, adjective], [il]).

french([m,e], [affix, noun, adjective, verb]).
french([m,e,s], [affix, noun, adjective, verb]).
french([m,a,l], [affix, noun, adjective, verb]).

french([p,r,e], [affix, noun, adjective]).

french([r,e], [affix, verb]).
french([r,ae], [affix, verb]).
french([r,a], [affix, verb]).
french([r], [affix, verb]).

french([s,u,p,e,r], [affix, noun, adjective, verb]).
french([s,u,r], [affix, noun, adjective, verb]).

% Roots

underfrench([t,h,e,e], [stem], [without]).
underfrench([t,y,p,i,q,u,e], [stem], [without]).
underfrench([n,a,l,l,e,r,g,i,q,u,e], [stem], [opposite]).

underfrench([r,i,e,u,r], [stem], [ante]).
underfrench([n,a,t,a,l], [stem], [ante]).

underfrench([d,a,t,e,r], [stem], [anti]).
underfrench([g,e,l], [stem], [anti]).

underfrench([b,i,o,g,r,a,p,h,i,q,u,e], [stem], [auto]).
underfrench([f,i,q,u,e], [stem]).
underfrench([f,a,i,s,a,n,t], [stem]).

underfrench([c,e,p,t,i,o,n], [stem]).
underfrench([e,n,q,u,e,t,e], [stem]).

underfrench([b,r,a,n,c,h,e,r], [stem]).
underfrench([o,b,e,i,r], [stem]).
underfrench([c,u,l,p,e,r], [stem]).

underfrench([l,e,x,i,e], [stem]).

underrench([b,a,r,q,u,e,r], [stem]).
underfrench([f,o,u,i,r], [stem]).

underfrench([h,u,m,e,r], [stem]).
underfrench([e,u,i,l,l,e,r], [stem]).
underfrench([p,i,l,e,r], [stem]).

underfrench([s,e,r,e,r], [stem]).
underfrench([m,i,g,e,r], [stem]).

underfrench([c,e,r,t,a,i,n], [stem], [in]).
underfrench([l,i,c,i,t,e], [stem], [il]).
underfrench([r,e,g,u,l,a,r], [stem], [ir]).
underfrench([p,o,s,s,i,b,l,e], [stem], [im]).

underfrench([c,o,n,n,a,i,t,r,e], [stem]).
underfrench([e,n,t,e,n,t,e], [stem]).
underfrench([h,e,u,r,e,u,x], [stem]).
underfrench([d,i,t], [stem]).

underfrench([h,i,s,t,o,i,r,e], [stem]).

underfrench([f,a,i,r,e], [stem]).
underfrench([d,i,r,e], [stem]).
underfrench([v,i,s,e,r], [stem]).
underfrench([c,o,n,t,e,r], [stem]).
underfrench([p,o,s,e,r], [stem]).
underfrench([f,a,c,e], [stem]).


% create underlying forms
% with surface forms

% use phonological conditioning to get rid of mismatch, il, ir
% Use specifically for cns a,an which to use after?



underFrench(Form, [word]) :-
    french(Prefix, [affix, adjective], [without]),
    underfrench(Root, [stem], [without]),
    append(Prefix,Root,Form).

underFrench(Form, [word]) :-
    french(Prefix, [affix, adjective], [opposite]),
    underfrench(Root, [stem], [opposite]),
    append(Prefix,Root,Form).
/*
underFrench(Form, [word]) :-
    french(Prefix, [affix, adjective], [in]),
    underfrench(Root, [stem], [in]),
    append(Prefix,Root,Form).

underFrench(Form, [word]) :-
    french(Prefix, [affix, adjective], [im]),
    underfrench(Root, [stem], [im]),
    append(Prefix,Root,Form).

underFrench(Form, [word]) :-
    french(Prefix, [affix, adjective], [il]),
    underfrench(Root, [stem], [il]),
    append(Prefix,Root,Form).

underFrench(Form, [word]) :-
    french(Prefix, [affix, adjective], [ir]),
    underfrench(Root, [stem], [ir]),
    append(Prefix,Root,Form).

underFrench(Form, [word]) :-
    french(Prefix, [affix, noun, adjective], [ante]),
    underfrench(Root, [stem], [ante]),
    append(Prefix,Root,Form).

underFrench(Form, [word]) :-
    french(Prefix, [affix, noun, adjective], [anti]),
    underfrench(Root, [stem], [anti]),
    append(Prefix,Root,Form).

underFrench(Form, [word]) :-
    french(Prefix, [affix, noun, adjective], [auto]),
    underfrench(Root, [stem], [auto]),
    append(Prefix,Root,Form).

*/











