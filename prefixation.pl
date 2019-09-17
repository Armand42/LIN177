% Simple English prefixation
% A stem can be a root

english([v,a,n],stem).
english([s,k,i,r,t],stem).
english([g,o,l,f],stem).
english([m,a,x,i],affix).
english([m,i,n,i],affix).

/*
B is an affix, C is another stem
take in a stem output get a stem

We never get a mini because its trying to do everything
it can do with maxies, tries to find the last solution, but infinitely recurses
can query english([m,i,n,i,g,o,l,f], stem)
it will show the result but will never generate it

All this is doing is appending an affix to a stem
*/
english(A,stem):-
	append(B,C,A),
	english(B,affix),
	english(C,stem).