include "globals.mzn";

int: n = 10; % a total of 10 persons.
array[1..n] of var 1..150: Person; % a list of 10 persons where n[1] is the parent, the rest are children. age restricted between 1 and 150. 

constraint alldifferent( Person ); %no one has the same age. 
constraint all_equal( [Person[i] - Person[i-1] | i in 3..10]); %constraint children to equal gap in ages.
constraint Person[2]>Person[3]; %constraint gap to be positive and Person[2] be the oldest child
constraint sum(a in 2..n)(Person[a]*Person[a]) = Person[1]*Person[1]; %constraint "the squared age of the parent is the sum of the squares of the ages of the childre."
solve satisfy;

output ["Ages: " ++ show(Person)];