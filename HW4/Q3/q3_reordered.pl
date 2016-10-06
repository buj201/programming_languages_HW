foo(roberta).
foo(ashwin).

hello(roberta).
hello(brock).
hello(john).

world(roberta).
world(ashwin).

goal(X) :- sub1(X),sub2(X).
sub1(X) :- foo(X).
sub2(X) :- hello(X),world(X).
