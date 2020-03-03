clear
close all
clc

func = @(t, X) [-(X(1)+X(1)^3)+2*X(2); 2*X(1) - (X(2)+X(2)^3)];

% part c
x_limit = 2;
time_set=10;
res = 0.1;
problem4c(x_limit, res, time_set, func)

function [] = problem4c(x_limit, res, time_set, func)
    x1 = linspace(-x_limit, x_limit, 40);
    x2 = linspace(-x_limit, x_limit, 40);

    [x,y] = meshgrid(x1, x2);
    u = zeros(size(x));
    v = zeros(size(x));
    
    % compute x_d1 and x_d2
    t = 0;
    for iter = 1:numel(x)
        x_d_res = func(t, [x(iter), y(iter)]);
        u(iter) = x_d_res(1);
        v(iter) = x_d_res(2);
    end
    
    figure()
    len = sqrt(u.^2+v.^2);
    quiver(x,y,u./len,v./len,'r')
    axis tight equal;
    hold on

    for point_iter = -x_limit:res:x_limit
        phaser(time_set, x_limit, point_iter, func);

        phaser(time_set, -x_limit, point_iter, func);

        phaser(time_set, point_iter, x_limit, func);

        phaser(time_set, point_iter, -x_limit, func);
        
        phaser(time_set, point_iter, point_iter, func);
        
        phaser(time_set, point_iter, -point_iter, func);
        
        phaser(time_set, -point_iter, point_iter, func);
        
        phaser(time_set, -point_iter, -point_iter, func);
        
    end
    hold off
end

function []=phaser(t_span, x1, x2, func)
        [~, points] = ode45(func, [0, t_span], [x1;x2]);        
        plot(points(:,1), points(:,2), 'LineWidth', 1.5)
        plot(points(1,1), points(1,2), 'bo')
        plot(points(end,1), points(end,2), 'bs')
end