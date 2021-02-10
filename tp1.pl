% Base de connaissance
homme(ahmed).
homme(imad).
homme(anis).
homme(amine).
homme(karim).
homme(issam).

femme(linda).
femme(dounia).
femme(karima).
femme(halima).

pere(ahmed, imad).
pere(imad, anis).
pere(anis, amine).
pere(anis, halima).
pere(imad, samia).
pere(karim, issam).

mere(dounia, samia).
mere(dounia, anis).
mere(samia, issam).
mere(karima, karim).
mere(karima, halima).

% new predicat

/* 
   * X is a parent of Y, under those conditions:
   	- X must be a father of Y
	OR
	- X must be a mother of Y
*/
parent(X,Y):- 
	    pere(X,Y);
	    mere(X,Y).

/*
   * X is the son of Y, under those conditions:
   	- X must be a male (homme)
	- Y must be a father of X
	OR
	- Y must be a mother of X

   *there is a another method which is using the parent(Y,X)
   Y has to be a parent for X
*/
fils(X,Y):- 
	  homme(X),
	  pere(Y,X);
	  mere(Y,X).
fils2(X,Y):- 
	  homme(X),
	  parent(Y,X).

/*Same for the "fils" case but here X has to be "femme" */
fille(X,Y):-
	  femme(X),
	  parent(Y,X).
/*
   * X is the grand-father of Y, under those conditions:
   	- X AND Y  must be a male (homme)
	- X must be a father of Z
	- Z must be a father of Y
*/
grand_pere(X,Y):-
		homme(X),
		homme(Y),
		pere(X,Z),
		pere(Z,Y).

/*Same for the grand-father case, but here X has to be "femme"*/
grand_mere(X,Y):-
		femme(X),
		femme(Y),
		mere(X,Z),
		mere(Z,Y).

/*
   * X is the brother of Y, under those conditions:
   	- X  must be a male (homme)
	- Z must be a parent of X
	- Z must be a parent of Y, which means they share the 
	same parent
*/
frere(X,Y):-
	   homme(X),
	   parent(Z,X),
	   parent(Z,Y).

/* Same for the frere case bust here X has to be "femme"*/
soeur(X,Y):-
	   femme(X),
	   parent(Z,Y),
	   parent(Z,Y).

