% model of the coconut problem 
include "globals.mzn";
% set parameter
%int: 5; % denote the given number of list 
int: n = 5;
 
array[1..n] of var int: Men; 
var int: coconut; % total number of coconut

constraint forall (i in 1..5) (Men[i] * 5 = coconut - i - sum([Men[j] | j in 1..i-1]));
constraint 0 = (coconut - sum(Men)) mod 5;
constraint forall (i in 1..5) (Men[i] > 0);


solve satisfy;
output ["men:", show(Men) , "\n"];
output ["no.coconut: ", show(coconut)];

