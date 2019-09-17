:- ['fulldisplay.pl'].
% French Prefixation

% French prefixes with their english meanings
french([a],[without]).
french([a,n],[opposite]).

french([a,n,t,e],[before]).
french([a,n,t,i],[against]).
french([a,u,t,o],[itself]).

french([b,e,n,e], [good]) :-
french([b,i,e,n], [good2]).

french([c,o,n,t,r,a], [againstit]).
french([c,o,n,t,r,e], [oppositeof]).

french([d,e], [separate]).
french([d,e,s], [separatefrom]).
french([d,i,s], [separatefrom2]).

french([m,e], [bad]).
french([m,e,s], [mis]).
french([m,a,l], [verybad]).
french([m,a,u], [bad2]).


% Root types along with prefixes that they should bind to

% Lexicon for adjectives 
underfrench([t,h,e,e],[adjective],[a]).
underfrench([t,y,p,i,q,u,e],[adjective],[a]).
underfrench([a,l,l,e,r,g,i,q,u,e],[adjective],[an]).

% Lexicon for adjectives, nouns
underfrench([r,i,e,u,r], [adjective, noun], [ante]).
underfrench([d,a,t,e,r], [adjective, noun], [anti]).
underfrench([g,e,l], [adjective, noun], [anti]).
underfrench([b,i,o,g,r,a,p,h,i,q,u,e], [adjective, noun], [auto]).

% Lexicon for adjectives, verbs
underfrench([f,i,q,u,e], [adjective, verb], [good]).
underfrench([f,a,i,s,a,n,t], [adjective, verb], [good2]).

% Lexicon for nouns
underfrench([c,e,p,t,i,o,n], [noun], [contra]).
underfrench([n,q,u,e,t,e], [noun], [contre]).

% Lexicon for verbs
underfrench([b,r,a,n,c,h,e,r], [verb], [de]).
underfrench([o,b,e,i,r], [verb], [des]).
underfrench([c,u,l,p,e,r], [verb], [dis]).

% Lexicon for nouns, adjectives, verbs
underfrench([c,o,n,n,a,i,t,r,e], [adjective, noun, verb], [me]).
underfrench([e,n,t,e,n,t,e], [adjective, noun, verb], [mes]).
underfrench([h,e,u,r,e,u,x], [adjective, noun, verb], [mal]).
underfrench([d,i,t], [adjective, noun, verb], [mau]).

% Predicates to form new words with their corresponding prefixes
% Prefix -a
frenchWords(Form, [word]) :-
    french(Prefix, [without]),
    underfrench(Root,[adjective], [a]),
    append(Prefix,Root,Form).

% Prefix -an
frenchWords(Form, [word]) :-
    french(Prefix, [opposite]),
    underfrench(Root,[adjective], [an]),
    append(Prefix,Root,Form).

% Prefix -ante
frenchWords(Form, [word]) :-
    french(Prefix, [before]),
    underfrench(Root,[adjective, noun], [ante]),
    append(Prefix,Root,Form).

% Prefix -anti
frenchWords(Form, [word]) :-
    french(Prefix, [against]),
    underfrench(Root,[adjective, noun], [anti]),
    append(Prefix,Root,Form).
    
% Prefix -auto
frenchWords(Form, [word]) :-
    french(Prefix, [itself]),
    underfrench(Root,[adjective, noun], [auto]),
    append(Prefix,Root,Form).

% Prefix -bene
frenchWords(Form, [word]) :-
    french(Prefix, [good]),
    underfrench(Root,[adjective, verb], [good]),
    append(Prefix,Root,Form).

% Prefix -bien
frenchWords(Form, [word]) :-
    french(Prefix, [good2]),
    underfrench(Root,[adjective, verb], [good2]),
    append(Prefix,Root,Form).

% Prefix -contra
frenchWords(Form, [word]) :-
    french(Prefix, [againstit]),
    underfrench(Root,[noun], [contra]),
    append(Prefix,Root,Form).

% Prefix -contre
frenchWords(Form, [word]) :-
    french(Prefix, [oppositeof]),
    underfrench(Root,[noun], [contre]),
    append(Prefix,Root,Form).

% Prefix -de
frenchWords(Form, [word]) :-
    french(Prefix, [separate]),
    underfrench(Root,[verb], [de]),
    append(Prefix,Root,Form).

% Prefix -des
frenchWords(Form, [word]) :-
    french(Prefix, [separatefrom]),
    underfrench(Root,[verb], [des]),
    append(Prefix,Root,Form).

% Prefix -dis
frenchWords(Form, [word]) :-
    french(Prefix, [separatefrom2]),
    underfrench(Root,[verb], [dis]),
    append(Prefix,Root,Form).

% Prefix -me
frenchWords(Form, [word]) :-
    french(Prefix, [bad]),
    underfrench(Root,[adjective, noun, verb], [me]),
    append(Prefix,Root,Form).

% Prefix -mes
frenchWords(Form, [word]) :-
    french(Prefix, [mis]),
    underfrench(Root,[adjective, noun, verb], [mes]),
    append(Prefix,Root,Form).

% Prefix -mal
frenchWords(Form, [word]) :-
    french(Prefix, [verybad]),
    underfrench(Root,[adjective, noun, verb], [mal]),
    append(Prefix,Root,Form).

% Prefix -mau
frenchWords(Form, [word]) :-
    french(Prefix, [bad2]),
    underfrench(Root,[adjective, noun, verb], [mau]),
    append(Prefix,Root,Form).
