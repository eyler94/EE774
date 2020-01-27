clc
clear
close all

%phase portraits
%Followed the example found in http://matlab.cheme.cmu.edu/2011/08/09/phase-portraits-of-a-system-of-odes/

x1 = linspace(-2, 2, 40);
x2 = linspace(-2, 2, 40);

[x,y] = meshgrid(x1, x2);
u = zeros(size(x));
v = zeros(size(x));

% compute x_d1 and x_d2
t = 0;
for iter = 1:numel(x)
    input=0;
    x_d_res = func(t, [x(iter),y(iter)]);
    u(iter) = x_d_res(1);
    v(iter) = x_d_res(2);
end

len = sqrt(u.^2+v.^2);
quiver(x,y,u./len,v./len,'r')
% figure(gcf)
axis tight equal;

hold on
for point_iter = -2:0.1:2
    iput=0;
    phaser(1,2,point_iter);
%     [~, points] = ode45(func,[0,1],[2;point_iter]);
%     plot(points(:,1), points(:,2),'LineWidth',1.5)
%     plot(points(1,1), points(1,2),'bo')
%     plot(points(end,1), points(end,2),'bs')
    
    [~, points] = ode45(func,[0,1],[-2;point_iter]);
    plot(points(:,1), points(:,2),'LineWidth',1.5)
    plot(points(1,1), points(1,2),'bo')
    plot(points(end,1), points(end,2),'bs')
    
    [~, points] = ode45(func,[0,1],[point_iter;2]);
    plot(points(:,1), points(:,2),'LineWidth',1.5)
    plot(points(1,1), points(1,2),'bo')
    plot(points(end,1), points(end,2),'bs')
    
    [~, points] = ode45(func,[0,1],[point_iter;-2]);
    plot(points(:,1), points(:,2),'LineWidth',1.5)
    plot(points(1,1), points(1,2),'bo')
    plot(points(end,1), points(end,2),'bs')
end

function func
%func = @(t, X) [-X(2); -0.5*X(1) + 1.5*X(2)];
    
end

function []=phaser(t_span,x1,x2)
    [~, points] = ode45(func,[0,t_span],[x1;x2]);
    plot(points(:,1), points(:,2),'LineWidth',1.5)
    plot(points(1,1), points(1,2),'bo')
    plot(points(end,1), points(end,2),'bs')
end



