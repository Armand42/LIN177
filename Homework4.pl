
% the
german([der], [determiner, nominative]).

% the
german([den], [determiner, accusative]).

% the
german([dem], [determiner, dative]).

% loves
german([liebt], [verb, transitive]).

% gives
german([gibt], [verb, distransitive]).

% fritz
german([fritz], [noun, animate]).

% bone
german([knochen], [noun, inanimate]).

% dog
german([hund], [noun, animate]).

% Nounphrase
german(Nounphrase, [nounphrase, nominative]) :-
    german(Determiner, [determiner,nominative]),
    german(Noun, [noun,animate]),
    append(Determiner, Noun, Nounphrase).

% Nounphrase
german(Nounphrase, [nounphrase, accusative]) :-
    german(Determiner, [determiner,accusative]),
    german(Noun, [noun,_]),
    append(Determiner, Noun, Nounphrase).

% Nounphrase
german(Nounphrase, [nounphrase, dative]) :-
    german(Determiner, [determiner,dative]),
    german(Noun, [noun,animate]),
    append(Determiner, Noun, Nounphrase).



% Verbphrase transitive 
german(Verbphrase, [verbphrase]) :-
    german(Verb, [verb, transitive]),
    german(Nounphrase, [nounphrase, accusative]),
    append(Verb, Nounphrase, Verbphrase).

% Verbphrase transitive 
german(Verbphrase, [verbphrase]) :-
    german(Verb, [verb, transitive]),
    german(Nounphrase, [nounphrase, accusative]),
    append(Nounphrase, Verb, Verbphrase).



% Verbphrase distransitive 
german(Verbphrase, [verbphrase]) :-
    german(Verb, [verb, distransitive]),
    german(Nounphrase1,[nounphrase, accusative]),
    german(Nounphrase2, [nounphrase, dative]),
    append([Verb, Nounphrase1, Nounphrase2], Verbphrase).

% Verbphrase distransitive 
german(Verbphrase, [verbphrase]) :-
    german(Nounphrase1,[nounphrase, accusative]),
    german(Verb, [verb, distransitive]),
    german(Nounphrase2, [nounphrase, dative]),
    append([Nounphrase1, Verb, Nounphrase2], Verbphrase).

% Verbphrase distransitive 
german(Verbphrase, [verbphrase]) :-
    german(Verb, [verb, distransitive]),
    german(Nounphrase2, [nounphrase, dative]),
    german(Nounphrase1,[nounphrase, accusative]),
    append([Verb, Nounphrase2, Nounphrase1], Verbphrase).
    
% Verbphrase distransitive 
german(Verbphrase, [verbphrase]) :-
    german(Nounphrase2, [nounphrase, dative]),
    german(Verb, [verb, distransitive]),
    german(Nounphrase1,[nounphrase, accusative]),
    append([Nounphrase2, Verb, Nounphrase1], Verbphrase).


% Sentence
german(Sentence, [sentence]) :-
    german(Nounphrase, [nounphrase, nominative]),
    german(Verbphrase, [verbphrase]),
    append(Nounphrase, Verbphrase, Sentence).

% Sentence
german(Sentence, [sentence, nominative]) :-
    german(Verbphrase, [verbphrase]),
    german(Nounphrase, [nounphrase]),
    append(Verbphrase, Nounphrase, Sentence).


/*
V NP
NP V

V NP1 NP2
NP1 V NP2
V NP2 NP1
NP2 V NP1

*/


