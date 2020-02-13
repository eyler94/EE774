clc
clear all
close all

%phase portraits
%Followed the example found in http://matlab.cheme.cmu.edu/2011/08/09/phase-portraits-of-a-system-of-odes/


%part c1
func = @(t, X) [X(1)-1/3*X(1)^3-X(2) + 0; 0.1*(2+1.5*X(1)-X(2))];
limit = 5;
time_set=20;
res = 0.1;

problem8(limit, res, time_set, func)
%%% It appears to want to be a stable, center, unstable focus, but gets
%%% sucked into a single point. I'm not sure why. 

%%% It's called a stable node ya dummy.

%part c2
func = @(t, X) [X(1)-1/3*X(1)^3-X(2) + 2; 0.1*(2+1.5*X(1)-X(2))];
limit = 5;
time_set=20;
res = 0.1;

problem8(limit, res, time_set, func)
%%% This one is definitely a stable, center, unstable focus. Super cool!

%%% Stable limit cycle, not center, and unstable node not focus.

%part c1
func = @(t, X) [X(1)-1/3*X(1)^3-X(2) + 0; 0.1*(2+0.5*X(1)-X(2))];
limit = 5;
time_set=20;
res = 0.1;

problem8(limit, res, time_set, func)
%%% It appears to want to be a stable, center, unstable focus, but gets
%%% sucked into two points this time. I'm 

%%% Two stable nodes... need I say more?

%part c2
func = @(t, X) [X(1)-1/3*X(1)^3-X(2) + 2; 0.1*(2+0.5*X(1)-X(2))];
limit = 5;
time_set=20;
res = 0.1;

problem8(limit, res, time_set, func)
%%% A saddle point with two stable foci on each side.


function [] = problem8(limit, res, time_set, func)
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



