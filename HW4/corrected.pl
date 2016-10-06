/* Problem 1: Create a number of Twitter users by stating several user(U) facts, where U is the user’s name. Note that all Twitter user names begin with the character @. (e.g., @tony) */

user('@ben').
user('@jill').
user('@andi').
user('@john').
user('@becca').
user('@leah').
user('@dan').
user('@cooper').
user('@nick').

/*. Problem 2: The relation follows(X,Y) establishes that user “X follows user Y .” Note that this relation should not be symmetric (i.e., user x following y does not imply that y follows x). Relate the above users by creating several follows facts.*/

follows('@ben', '@jill').
follows('@andi', '@john').
follows('@leah', '@andi').
follows('@jill', '@cooper').
follows('@nick', '@jill').
follows('@jill', '@becca').
follows('@becca', '@dan').
follows('@dan', '@ben').
follows('@john', '@nick').
follows('@cooper', '@leah').

/* 3. The relation tweet(U,I,M) represents a tweet broadcast by user U with unique identifier I and message M. The identifier is needed because the same user could tweet the same message twice, but this is considered 2 distinct tweets. We can represent the message M as an array of atoms. We will not concern ourselves with the 140 character limit, nor the length of the array, for this assignment. Create several tweet facts.*/

tweet('@ben', 0, [hello, world]).
tweet('@andi', 1, [words, about, politics]).
tweet('@leah', 2, [scores, from, sportball]).
tweet('@jill', 3, [gossip, about, celebrities ]).
tweet('@nick', 4, [factoids, relating, to, the, news]).
tweet('@jill', 5, [eating, food, and, pictures, of, food]).
tweet('@becca', 6, [trolling, somebody, with, terrible, words]).
tweet('@dan', 7, [anger, about, politics]).
tweet('@john', 8, [protest, and, shouting]).
tweet('@cooper', 9, [shouting, about, delicious, food]).


/*  4. Create a Prolog relation retweet(U,I) which represents user U retweeting the tweet identified by I.*/

retweet('@ben',4).
retweet('@jill',8).
retweet('@andi',1).
retweet('@nick',9).
retweet('@john',5).
retweet('@dan',7).
retweet('@ben',2).
retweet('@becca',2).
retweet('@cooper',2).

/*  5.  Create a Prolog relation feedhelper(U,F,M,I) which establishes user U’s Twitter feed. F is any user who U follows, M is any message tweeted or retweeted by F and I is a unique tweet identifier. */


%Helper code provided in assignment
feed(U,M) :- uniquefeed(U, O), remove_ident(O, M).
uniquefeed(U,R) :- setof([I,F|M], feedhelper(U,F,M,I), R).
remove_ident([],[]).
remove_ident([[_|Y]|T1], [H2|T2]) :- Y=H2, remove_ident(T1,T2).


%feedhelper relation

feedhelper(U,F,M,I) :- follows(U, F), tweet(F, I, M).
feedhelper(U,F,M,I) :- follows(U, R), retweet(R, I), tweet(F, I, M).

/* 6. Create a Prolog relation search(K,U,M) which searches the universe of tweets for the keyword K. Variables U and M, when uninstantiated, will be bound to each tweet sent by user U whose message is M. For this homework, we will limit searches to single atoms so that finding a particular keyword (i.e., atom) within a tweet amounts to searching the tweet’s array of atoms for a match.*/

member(X, [X|_]) :- !. %Handles one message withs multiple matches
member(X, [_|T]) :- member(X,T).
search(K, U, M) :- tweet(U, _, M), member(K, M).


/* 7. Create a Prolog relation isviral(S,I,R), where I is the unique identifier of a tweet, S = u_n and R = u_1. Note that if isviral holds for some n, then by definition it also holds for all i such that 1 < i < n.*/

isviral(S,I,R) :- tweet(S,I,_),follows(R,S).
isviral(S,I,R) :- retweet(Anon,I),follows(R,Anon),isviral(S,I,Anon).

% 8.) isviral (S, I, R, M)
isviral(S,I,R,N) :- tweet(S,I,_),follows(R,S),N=<1.
isviral(S,I,R,N) :- retweet(Anon,I),follows(R,Anon),isviral(S,I,Anon,N-1).
