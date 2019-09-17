% 1.4 Facts

% collection of facts is a database
% john likes mary

likes(john, mary).
likes(mary, john).

valuable(gold).     % gold is valuable
female(jane).       % Jane is female
owns(jane,gold).    % Jane owns gold
father(john,mary).  % john is father of mary
gives(john,book,mary)   % john gives the book to mary

% 1.5 Questions
% Once we have some facts, we can ask some questions 
% about them
% Returns either the outcomes or false
% Keep tapping ; to query possible outcomes

likes(joe, fish).
likes(joe, mary).
likes(mary, book).
likes(john, book).
likes(john, france).

% 1.6 Variables
% When Prolog is asked a question containing a variable, Prolog
% seaerches through all its facts to find an object that the 
% variable could stand for.

likes(john, flowers).
likes(john, mary).
likes(paul, mary).
/*
?- likes(X,Y).
X = john,
Y = mary ;
X = mary,
Y = john ;
X = joe,
Y = mary ;
X = mary,
Y = book ;
X = john,
Y = book ;
X = john,
Y = france ;
X = john,
Y = flowers ;
X = john,
Y = mary ;
X = paul,
Y = mary.
*/

% 1.7 Conjunctions
% Multiple separate goals that prolog must satisfy
% Suppose we have the following database
% The , is the logical and and serves to separate any number of
% different goals that have to be satisfied in order to answer a question.

likes(mary, chocolate).
likes(mary, wine).
likes(john, wine).
likes(john, mary).

% We want to ask if john and mary like each other
% To do this we ask if john likes mary && if mary likes john
/*?- likes(john, mary), likes(mary,john).
true .

?- likes(mary, X), likes(john,X).
X = book .

?- likes(mary, X), likes(john,X).
X = book ;
X = wine.
*/

% Backtracking occurs until both conditions are met

1.8 Rules
% In prolog, rules are used when you want to say that a fact
% depends on a group of other facts
% A rule consists of a head and a body
% :- is pronounced if

% JOHN LIKES ANYONE WHO LIKES WINE AND FOOD
likes(john, X) :-
    likes(X, wine),
    likes(X, food).

% Supposed John likes any female who likes wine
likes(john, X) :-
    female(X),
    likes(X, wine).

% Consider a database consisting of facts about some of the 
% family of Queen Victoria.

% The predicate parents(X, Y, Z) means "the parents of X are Y and Z".

male(albert).
male(edward).

female(alice).
female(victoria).

parents(edward, victoria, albert).
parents(alice, victoria, albert).

% Sister will be used to show that X is a sister of Y 
% X is a sister if:
%       X is female
%       X has mother M and father F and
%       Y has the same mother and father as X does

sister_of(X, Y) :-
    female(X),
    parents(X, M, F),
    parents(Y, M, F).
/*
?- sister_of(X,Y).
X = alice,
Y = edward ;
X = Y, Y = alice ;
false.

*/
% A person may steal something if the person is a thief and the 
% person likes the thing.

thief(john).

may_steal(P, T) :-
    thief(X),
    likes(X,Y).


% Chapter 2
% 2.4 Equality & Unification

equal(X, Y) :-
    X = Y.

% 2.5 Arithmetic
% The predicate reigns is defined such that the goal
% of reigns(X,Y,Z) is true if the prince named X reigned
% from year Y to year Z.

reigns(rhodri, 844, 878).
reigns(anarawd, 878, 916).
reigns(hywel_dda, 916, 950).
reigns(lago_ap_idwal, 950, 979).
reigns(hywel_ap_ieuaf, 979, 985).
reigns(cadwallon, 985, 986).
reigns(maredudd, 986, 999).

% Let us define a predicate prince(X,Y), which is true
% if the prince named X was on the throne during year Y.

% X was a prince during year Y if:
%   X reinged between years A and B, and   
%   Y is between A and B, inclusive.

prince(X,Y) :-
    reigns(X,A,B),
    Y >= A,
    X <= B.


% Example 2

population(usa, 203).
population(india, 548).
population(china, 800).
population(brazil, 108).

area(usa, 3).
area(india, 1).
area(china, 4).
area(brazil, 3).

% Now to find the population density of a country, we must
% use the rule that density is the population divided by the area.

% The population density of a country X is Y, if:
%   The population of X is P, and
%   The area of X is A, and
%   Y is calculated by dividing P by A.

density(X,Y) :-
    population(X, P),
    area(X, A),
    Y is P/A.