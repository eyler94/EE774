clc
clear
close all
%%%Part D
func_w = @(t,w) [w(2)*w(3)/3; (-2)*w(1)*w(3)/2; w(1)*w(2)];

t_final = 1;

hold on
axis square
for iter = 0:1000
    w=randi([-100,100],3,1);
    w=w./norm(w);
    [~, points] = ode45(func_w,[0,t_final],w);
    plot3(points(:,1), points(:,2), points(:,3), 'LineWidth',1.5)
%     plot3(points(1,1), points(1,2), points(1,3), 'bo')
%     plot3(points(end,1), points(end,2), points(end,3), 'bs')
end

%%%Part E
% Two of the body axes (b1 and b3) will continue to spin about them (the
% are stable centers. b2 however is a saddle point and will not remain
% nearby.
