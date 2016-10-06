(*Problem 3.1*)

fun listsum xs n = (foldl (fn (x,y) => x + y) 0 xs) = n;

(*
listsum [1,2,3] 6;
listsum [1,2,3] 5;
listsum [] 5;
listsum [1] 11;
*)

(*Problem 3.2*)

fun isten xs = listsum xs 10;

(*
isten [1,2,3,4];
isten [10];
isten [5,5];
isten [];
isten [11];
isten [5,6];
*)

(*Problem 3.3*)

fun length xs = foldl (fn (x,y) => 1 + y) 0 xs;

(*=
length [];
length [1];
length [67,2];
length [1,42,347];
length [1,2,~134,4];
*)

(*Problem 3.4*)

fun reverse xs = foldl (fn (x,y) => x::y) nil xs;

(*=
reverse [1,2356,14,123, 12,~13, 42,347];
reverse ["a","fat","dog","ran","slow"];
*)

(*Problem 3.5*)


exception Mismatch of string;

fun zip ([], []) = []
  | zip ([], (y::ys)) = raise Mismatch "Input lists have different lengths"
  | zip ((x::xs), []) = raise Mismatch "Input lists have different lengths"
  | zip ((x::xs), (y::ys)) = ((x, y) :: (zip (xs, ys)));

(*
zip ([1,2,3],[~1,~2,~3]);
zip ([1,2,3],["a","b","c"]);
zip ([1,2,3],[~1,~2]);
zip ([1,2],[~1,~2,~3]);
*)

(*Problem 3.6*)

fun unzip xypairs = foldr (fn ((x1,y1), (x2,y2)) => ((x1::x2),(y1::y2))) ([],[]) xypairs;

(*
unzip (zip ([1,2,3],["a","b","c"]));
unzip (zip ([1,2,3],[~1,~2,~3]));
*)
