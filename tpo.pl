

phone(p).           % p is a phone
phone(b).
phone(t).
phone(d).

lab(p).
lab(b).

voi(b).
voi(d).

alv(t).
alv(d).


% ========================
animal([fido], [dog]).                 % different kind of animal/ 2
animal([bruiser], [dog]).
animal([simba], [cat]).
animal([bessie], [cow]).


pet(X)  :-
    animal(X,[Y]),                    % X is pet, Y cannot be a cow
    not(Y = cow).                 % lists of pets, pulling atom out of list
/*
pet(X)  :-                          % predicate animal is a pet ifConditions apply
    animal(X),                      % All animals not a cow
    not(cow(x)).

dog(fido).
dog(bruiser).

animal(fido).
animal(bruiser).
animal(simba).

animal(bessie).

cat(simba).

cow(bessie).
*/
