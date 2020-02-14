clc
clear
close all

syms x1 x2 x3

eq1 = 0 == -x2*x3+1;
eq2 = 0 == x1*x3-x2;
eq3 = 0 == x3^2*(1-x3);

sol =  solve([eq1, eq2, eq3], [x1, x2, x3]);

x1_res = sol.x1
x2_res = sol.x2
x3_res = sol.x3

%%% Part b

syms lmbd

res = [lmbd 1 1;
     -1 lmbd+1 -1;
     0 0 lmbd+1];
 
eq4 = 0 == det(res);
sol = solve(eq4, lmbd)

A = [0 -1 -1;
     1 -1 1;
     0 0 -1];

syms t
eA = expm(A*t);
eAt = expm(A'*t);
P = int(eAt*eA,t,0,inf);

X = [x1; x2; x3];

V = X'*P*X


