foo(ashwin).
foo(roberta).

hello(brock).
hello(roberta).
hello(john).

world(ashwin).
world(roberta).

goal(X) :- sub1(X),sub2(X).
sub1(X) :- foo(X).
sub2(X) :- hello(X), write("Before break"), !, write("After break"), world(X).
