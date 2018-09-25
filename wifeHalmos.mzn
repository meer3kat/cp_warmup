include "globals.mzn";

int: n = 10; 
set of int: Guest = 1..n;
set of int: Shake = 1..n;
 
array[Guest,Shake] of var 0..1: Handshake; 


constraint forall(g in Guest) (Handshake[g,g] = 0);
constraint forall(i,g in 1..n) (Handshake[i,g] = Handshake[g,i]); %symmetrc matrix
constraint alldifferent([sum([Handshake[g,i] | i in Shake]) | g in 1..n-1]);


constraint forall(g in [1,3,5,7,9]) (Handshake[g,g+1] = 0);
%constraint forall(g in [1,3,5,7,9]) (Handshake[g+1,g] = 0);
%constraint max([sum([Handshake[g,i] | i in Shake]) | g in 1..n-1]) = 8;
%constraint min([sum([Handshake[g,i] | i in Shake]) | g in 1..n-1]) = 0;

solve satisfy;

output ["result", "\n", show2d(Handshake), "\n", show([sum([Handshake[g,i] | i in Shake]) | g in Guest])];
