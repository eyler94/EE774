clc
clear
close all

%phase portraits
%Followed the example found in http://matlab.cheme.cmu.edu/2011/08/09/phase-portraits-of-a-system-of-odes/
func1 = @(t, X) [X(2); -0.5*X(1) + 1.5*X(2)];
func2 = @(t, X) [X(2); -0.5*X(1) + 1.5*X(2) + 0.5*(0.9*X(1)-3.2*X(2))];
func3 = @(t, X) [X(2); -0.5*X(1) + 1.5*X(2) + 0.5*sat(0.9*X(1)-3.2*X(2),1)];


%part a
limit = 1;
time_set=0.5;
res = 0.1;
problem5(limit, res, time_set, func1)

% part b
limit = 1;
time_set=0.5;
res = 0.1;
problem5(limit, res, time_set, func2)

% part c
limit = 1;
time_set=0.5;
res = 0.1;
problem5(limit, res, time_set, func3)

function [] = problem5(limit, res, time_set, func)
    x1 = linspace(-limit, limit, 40);
    x2 = linspace(-limit, limit, 40);

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

    for point_iter = -limit:res:limit
        phaser(time_set, limit, point_iter, func);

        phaser(time_set, -limit, point_iter, func);

        phaser(time_set, point_iter, limit, func);

        phaser(time_set, point_iter, -limit, func);
    end
    hold off
end

function []=phaser(t_span, x1, x2, func)
        [~, points] = ode45(func, [0, t_span], [x1;x2]);        
        plot(points(:,1), points(:,2), 'LineWidth', 1.5)
        plot(points(1,1), points(1,2), 'bo')
        plot(points(end,1), points(end,2), 'bs')
end

function u = sat(u,lim)
    if (abs(u) >= 1)
        u = sign(u)*lim;
    end
end
