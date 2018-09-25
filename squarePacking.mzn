% model of the permutation 
include "globals.mzn";

% set parameter
int: n; % number of rectangle
array[1..n] of var 1..n: size; 
array[1..n] of var 0..n*n: xloc;
array[1..n] of var 0..n*n: yloc; %starting position of each rectangle
var int: x;
var int: y;
var int: area = x*y;


constraint alldifferent(size);
constraint x = max([xloc[i] + size[i] | i in 1..n]);
constraint y = max([yloc[i] + size[i] | i in 1..n]);

constraint diffn(xloc,yloc,size,size);

solve minimize area;

%output ["area: " ++ show(area)]

