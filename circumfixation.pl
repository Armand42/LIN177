german([k,j,u,s],stem).
german([f,r,a,g],stem).
german([l,i,b],stem).
german([[g, e], [t]], [affix, participle]).

german(B,participle):-
	german(A,stem),
	german([X, Y], [affix, participle]),
	append([X,A,Y],B).





indonesian([b,i,s,a],verb).
indonesian([b,a,n,g,u,n],verb).
indonesian([t,i,d,a,k,m,a,m,p,u],verb).
indonesian(B,noun):-
	indonesian(A,verb),
	append([[k,e],A,[a,n]],B).


chickasaw([ch,o,k,m,a],affirmative).
chickasaw([l,a,k,n,a],affirmative).
chickasaw([p,a,l,l,i],affirmative).
chickasaw([t,i,w,w,i],affirmative).
chickasaw(A,negative):-
	chickasaw(B,affirmative),
	append(C,[_],B),
	append([[i,k],C,[o]],A).
