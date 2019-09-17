% English Plurals

:- ['properties.pl'].
:- ['entailment.pl'].




% map
underenglish([m,ae,P3], [noun,regular,singular], [map]) :-
    phone(P3), lab(P3), not(voi(P3)), not(cnt(P3)).
% lab
underenglish([l,ae,P3], [noun,regular,singular], [lab]) :-
    phone(P3), lab(P3), voi(P3), not(cnt(P3)), not(nas(P3)).
% pass
underenglish([p,ae,P3], [noun,regular,singular], [pass]) :-
    phone(P3), sib(P3), not(voi(P3)), not(pal(P3)).

% ox
underenglish([a,k,s], [noun, irregular, singular], [ox]).
underenglish([a,k,s,e,n], [noun, irregular, plural], [ox]).


english(SurfaceForm, [noun, irregular, plural], [ox]) :-
    underenglish(Form, [noun, irregular, singular], [ox]),
    append(Form, [e,n], SurfaceForm).


% child
underenglish([ch,a,j,l,d], [noun, irregular, singular], [child]).
% underenglish([ch,i,l,d,r,e,n], [noun, irregular, plural], [child]).

english(SurfaceForm, [noun, irregular, plural], [child]) :-
    underenglish(Form, [noun, irregular, singular], [child]),
    Form = [FirstPhone | Tail],         % take ch off of ajld
    Tail = [_ | Tail2],                 % a jld 
    Tail2 = [_, LasPartOfRoot],         % j ld
    append(FirstPhone, [i], FirstTwo),
    append(FirstTwo, LasPartOfRoot, Mutation),      % child to chil
    append(Mutation, [r,e,n], SurfaceForm).
    
% want a relation between them    
% lexicon   get am because be exists
underenglish([b,e], [verb,base,infinitive], [be]).
english([a,m], [verb,conjugated, 1stperson], [be]) :-
    underenglish([b,e], [verb,base,infinitive], [be]).

% Productive affix
underenglish([Form], [suffix, regular, plural], [plural]) :-
    phone(Form), sib(Form), not(pal(Form)).

% lexical conditioning 
english(Form, Properties, Meaning) :-
    underenglish(Form,Properties,Meaning),
    Properties = [_,irregular,singular].

% Phonological conditioning
english(Form, Properties, Meaning) :-
    underenglish(Form, Properties, Meaning),
    Properties = [_,regular,singular].

% Last phone is sibilant
english(Form, [POS, regular, plural], Meaning) :-
    underenglish(UnderlyingForm, [POS, regular, singular], Meaning),
    underenglish(Suffix, [suffix, regular, plural], [plural]),
    last(UnderlyingForm, LastPhone),
    sib(LastPhone),
    voi(Suffix),
    phone(Vowel), not(cns(Vowel)), not(bck(Vowel)), not(mid(Vowel)),
        hih(Vowel), not(tns(Vowel)),
    append([UnderlyingForm,[Vowel] [Suffix]], Form).

% Last phone is not sibilant
english(Form, [POS, regular, plural], Meaning) :-
    underenglish(UnderlyingForm, [POS, regular, singular], Meaning),
    underenglish(Suffix, [suffix, regular, plural], [plural]),
    last(UnderlyingForm, LastPhone),
    phone(LastPhone), not(sib(LastPhone)),
    homorganic(LastPhone, Suffix),
    append(UnderlyingForm, [Suffix], Form).

homorganic(A, B) :-
    voi(A) <=> voi(B).



