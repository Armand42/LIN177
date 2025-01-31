% Quechua interfixation
quechua([a,a,a,w],root,how(_)).

quechua([ch,ch],affix,surprising).
quechua([ch,l],affix,indignant).
quechua([k,k],affix,painful).
quechua([kh,k],affix,hot).
quechua([l,l],affix,cold).
quechua([ny,ny],affix,pretty).
quechua([t,t],affix,ugly).

quechua([A1,B1,A2,B2,A3,A4],interjection,C):-
	quechua([A1,A2,A3,A4],root,C),
	quechua([B1,B2],affix,D),
	arg(1,C,D).



% Arabic interfixation
arabic([k,t,b],root).
arabic([q,t,l],root).	
arabic([a,a],affix).
arabic([u,i],affix).

arabic([C1,V1,C2,V2,C3],verb):-
	arabic([C1,C2,C3],root),
	arabic([V1,V2],affix).

arabic([C1,V1,C2,C2,V2,C3],verb):-
	arabic([C1,C2,C3],root),
	arabic([V1,V2],affix).

arabic([C1,V1,V1,C2,V2,C3],verb):-
	arabic([C1,C2,C3],root),
	arabic([V1,V2],affix).

arabic([t,V1,C1,V1,V1,C2,V2,C3],verb):-
	arabic([C1,C2,C3],root),
	arabic([V1,V2],affix).

arabic([n,C1,V1,V1,C2,V2,C3],verb):-
	arabic([C1,C2,C3],root),
	arabic([V1,V2],affix).

arabic([C1,t,V1,C2,V2,C3],verb):-
	arabic([C1,C2,C3],root),
	arabic([V1,V2],affix).

arabic([s,t,V1,C1,C2,V2,C3],verb):-
	arabic([C1,C2,C3],root),
	arabic([V1,V2],affix).

