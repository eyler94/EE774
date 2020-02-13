clc
clear
close all

syms w1 w2 w3

eq1 = 0 == w2*w3;
eq2 = 0 == w1*w3;
eq3 = 0 == w1*w2;

solve([eq1, eq2, eq3])


%% part C

syms lmbda_s I1 I2 I3 lmbda

A1 = [0 0 0;
      0 0 lmbda_s*(I3-1)/I2;
      0 lmbda_s*(1-I2)/I3 0];
  
eq1 = 0 == det(lmbda*eye(3)-A1);

roots_1 = solve(eq1, lmbda)

A2 = [0 0 lmbda_s*(1-I3)/I1;
      0 0 0;
      lmbda_s*(I1-1)/I3 0 0];
  
eq2 = 0 == det(lmbda*eye(3)-A2);

roots_2 = solve(eq2, lmbda)

A3 = [0 lmbda_s*(I2-1)/I1 0;
      lmbda_s*(1-I1)/I2 0 0;
      0 0 0];
  
eq3 = 0 == det(lmbda*eye(3)-A3);

roots_3 = solve(eq3, lmbda)

%% part D
func_w = @(t,w) [w(2)*w(3)/3; (-2)*w(1)*w(3)/2; w(1)*w(2)]

















