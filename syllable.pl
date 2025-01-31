% Syllable structure of English

:- ['properties.pl'].


syllable(A):-
	onset(B),
	rhyme(C),
	append(B,C,A).

	/** The concatenation of an onset and a rhyme is a syllable **/

										
onset([A]):- 								
	phone(A),cns(A),not(nas(A)). 
										
	/** p,b,t,d,k,g,f,v,th,dh,s,z,sh,zh,ch,dj,l,r,j,w,h are onsets **/


onset([A]):- 								
	phone(A),nas(A),not(vel(A)).
										
	/** m,n are onsets **/


onset([A,B]):-								
	phone(A),not(snt(A)),not(cnt(A)),not(pal(A)),
	phone(B),alv(B),pal(B).
	/* list of two items*/
	/** pr, br, tr, dr, kr, gr are onsets **/


onset([A,B]):-								
	phone(A),not(snt(A)),not(cnt(A)),not(cor(A)),
	phone(B),snt(B),not(nas(B)),alv(B),not(pal(B)).

	/** pl, bl, kl, gl are onsets **/


onset([A,B]):-								
	phone(A),not(snt(A)),not(cnt(A)),not(lab(A)),not(pal(A)),
	phone(B),cnt(B),vel(B).
	
	/** tw, dw, kw, gw are onsets **/


onset([A,B]):-								
	phone(A),not(voi(A)),cnt(A),lab(A),
	phone(B),snt(B),cnt(B),alv(B).

	/** fl, fr are onsets **/


onset([A,B]):-								
	phone(A),not(voi(A)),cnt(A),not(alv(A)),cor(A),
	phone(B),alv(B),pal(B).

	/** thr, shr are onsets **/


onset([A,B]):-								
	phone(A),not(voi(A)),cnt(A), alv(A),
	phone(B),cns(B),snt(B),not(nas(B)),not(pal(B)).

	/** sl, sw are onsets **/


onset([A,B]):-								
	phone(A),not(voi(A)),cnt(A),alv(A),
	phone(B),nas(B),not(vel(B)).

	/** sm, sn are onsets **/


onset([A,B|C]):-							
	phone(A),not(voi(A)),cnt(A),alv(A),
	phone(B),not(voi(B)),not(cnt(B)),not(pal(B)),
	onset([B|C]).
	/* phone A class and phone B class
	splitting up an existing onset such that B is the head
	*/
	/** an s followed by a ptk-onset is an onset **/


onset([]).									

	/** onsets may be empty **/


rhyme(C):-								
	nucleus(A),
	coda(B),
	append(A,B,C).

	/** the concatenation of a nucleus and a coda is a rhyme **/


nucleus([A]):-								
	phone(A),not(cns(A)).

	/** any vowel is a nucleus **/


nucleus([A,B]):-
	phone(A),mid(A),not(ctr(A)),
	phone(B),cns(B),snt(B),not(nas(B)),not(alv(B)).

	/** ej,ew,oj,ow are nuclei **/


nucleus([A,B]):-
	phone(A),low(A),bck(A),
	phone(B),cns(B),snt(B),not(nas(B)),not(alv(B)).

	/** aj, aw are nuclei **/


coda([]).									

	/** codas may be empty **/


coda([A]):-								
	phone(A),not(snt(A)).

	/* p,b,t,d,k,g,f,v,th,dh,s,z,sh,zh,ch,dj,h are codas **/


coda([A]):-								
	phone(A),nas(A).

	/* m,n,ng are codas */


coda([A]):-
	phone(A),snt(A),not(nas(A)),alv(A).

	/* l,r are codas */


syllable(A,B):-
	length(A,B),
	syllable(A).


