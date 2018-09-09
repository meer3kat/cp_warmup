% model of the permutation 
include "globals.mzn";
% set parameter
int: n; % 

%set of int: 
array[1..n] of var 1..n: numbers; 
var int: b;

constraint alldifferent( numbers ); 
constraint b = sum([numbers[i]*numbers[i+1] | i in 1..n-1]);

solve maximize b;
