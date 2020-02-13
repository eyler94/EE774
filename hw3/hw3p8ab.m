clc
clear
close all

syms x1 x2 x3

eq1 = 0 == -x2*x3+1;
eq2 = 0 == x1*x3-x2;
eq3 = 0 == x3^2*(1-x3);

sol =  solve([eq1, eq2, eq3], [x1, x2, x3]);

x1 = sol.x1
x2 = sol.x2
x3 = sol.x3

%%% Part b

syms lmbd

A = [lmbd 1 1;
     -1 lmbd+1 -1;
     0 0 lmbd+1];
 
eq4 = 0 == det(A);

solve(eq4, lmbd)
    