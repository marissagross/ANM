%ExPDE14
% Lax Friedrichs for a conservation law

BC = @(t)  0;
IC = @(x) exp(-200*(x-3).^2) + 2.6*exp(-10*(x-6).^2);
f = @(u) 3*u-u^3;

dx = .01;
dt = 1e-4;
x = 0:dx:10;
t = 0:dt:0.3;
N = length(x);
M = length(t);
u = zeros(N,2); % Lax Friedrichs

% initial condition
u(:,1) = IC(x);
figure(1)
hold on
plot(x,u(:,1)),axis([0 10 0 3])
title('wave speed is 3(1-u^2)')
pause

for n=1:M-1
    % Lax Friedrichs
    u(1,2) = BC(t(n+1));
    for i=2:N-1
        u(i,2) = .5*(u(i-1,1)+u(i+1,1))-dt/(2*dx)*(f(u(i+1,1))-f(u(i-1,1)));
    end
    u(N,2) = 2*u(N-1,2)-u(N-2,2);
    u(:,1) = u(:,2);
    if (mod(n,100)==0)
        plot(x,u(:,1)),axis([0 10 0 3])
        drawnow
        title('wave speed is 3(1-u^2)')
    end
end