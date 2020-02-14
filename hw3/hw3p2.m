clc
clear
close all
%%%part D
func_w = @(t,w) [w(2)*w(3)/3; (-2)*w(1)*w(3)/2; w(1)*w(2)];

t_final = 10;

hold on
for iter = 0:1000
    w=randi([-100,100],3,1);
    w=w./norm(w);
    [~, points] = ode45(func_w,[0,t_final],w);
    plot3(points(:,1), points(:,2), points(:,3), 'LineWidth',1.5)
    plot3(points(1,1), points(1,2), points(1,3), 'bo')
    plot3(points(end,1), points(end,2), points(end,3), 'bs')
end















