% model of the permutation 
include "globals.mzn";

int: n; % 

array[1..n] of var 1..n: numbers; 
var int: b = sum([numbers[i]*numbers[i+1] | i in 1..n-1]);

constraint alldifferent( numbers ); 

solve maximize b;

output ["sum: " ++ show(b)]