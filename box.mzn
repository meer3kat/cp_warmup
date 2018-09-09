% model of the permutation 
include "globals.mzn";

% set parameter
int: n; % number of rectangle
array[1..n] of var 1..n: size; 
array[1..n] of var 0..n*n: xloc;
array[1..n] of var 0..n*n: yloc; %starting position of each rectangle
var int: area;
var int: x;
var int: y;

constraint alldifferent(xloc);
constraint alldifferent(yloc);
constraint alldifferent(size);
constraint x = max([xloc[i] + i | i in 1..n]);
constraint y = max([yloc[i] + i | i in 1..n]);
constraint area = x*y;

constraint diffn(xloc,yloc,size,size);

solve minimize area;

