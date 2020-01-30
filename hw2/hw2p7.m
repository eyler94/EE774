clc
clear
close all

sigma = 10;
b = 8/3;
r = 28;

func = @(t, X) [10*(X(2)-X(1)); 28*X(1)-X(2)-X(1)*X(3); X(1)*X(2)-8/3*X(3)];

t_span = 10;
% [~, points] = ode45(func, [0, t_span],[0;2;0]) 

figure()
hold on

for init = [[0;2;0] [0;-2;0] [0;2.01;0]]
    [~, points] = ode45(func, [0, t_span],init);        
    plot3(points(:,1),points(:,2),points(:,3));%,'Linewidth',1.5);
    plot3(points(1,1),points(1,2),points(1,3),'bo');
    plot3(points(end,1),points(end,2),points(end,3),'bs');
end