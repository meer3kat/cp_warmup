include "globals.mzn";

int: n = 10; % a list of 10 persons
%int: gap
%set of int: 
array[1..n] of var 1..150: Person; 

constraint alldifferent( Person );
%constraint for all(a in 3..n)(Person[a]-Person[a-1] = gap
constraint all_equal( [Person[i] - Person[i-1] | i in 3..10]); 
constraint sum(a in 2..n)(Person[a]*Person[a]) = Person[1]*Person[1];
solve satisfy;
