bontoc([p,u,s,i],nominal).
bontoc([f,i,k,a,s],nominal).
bontoc([k,i,l,a,d],nominal).
bontoc([f,u,s,u,l],nominal).
bontoc([ng,i,t,a,d],nominal).
bontoc([u,m],affix).

bontoc(D,verbal):-
	bontoc([A|B],nominal),		% take head from nominal (p)
	bontoc(C,affix),			% grab um from affix
	append([[A],C,B],D).		% append (p) um usi into list D



sioux([[ch,e],[t,i]],root).
sioux([[sh,u],[t,a]],root).
sioux([[w,a]],affix).
sioux([[u,n]],affix).
sioux(D,verb):-
	sioux([A|B],root),
	sioux(C,affix),
	append([[A],C,B],D).

ulwa([[[u,u]]],[noun]).
ulwa([[[b,i],[l,a,m]]],[noun]).
ulwa([[[s,u,u]],[[l,u]]],[noun]).
ulwa([[[w,a],[s,a]],[[l,a]]],[noun]).
ulwa([[[k,i]]],[affix]).
ulwa([[[n,i]]],[affix]).
ulwa([[[k,i],[n,a]]],[affix]).
ulwa([[[m,a]]],[affix]).
ulwa([[[m,a],[n,a]]],[affix]).
ulwa([[[k,a]]],[affix]).
ulwa([[[k,a],[n,a]]],[affix]).
ulwa(D,[noun,possessive]):-
	ulwa([A|B],[noun]),
	ulwa(C,[affix]),
	append([[A],C,B],D).
