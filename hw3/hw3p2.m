clc
clear
close all

syms w1 w2 w3

eq1 = 0 == w2*w3;
eq2 = 0 == w1*w3;
eq3 = 0 == w1*w2;

solve([eq1, eq2, eq3])

