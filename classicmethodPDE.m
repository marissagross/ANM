%Classic Method
a = 0;          D = 3000;       c = 0.1;
L = 1;          dx = 0.01;      x = 0:dx:L;
tmax = 0.001;   dt = 1e-8;      t = 0:dt:tmax;

beta = (a*dt)/(2*dx);
rt = (D*dt)/(dx^2);

N = length(x);
M = length(t); 
u = zeros(N,2); 

%left boundary condition
f = @(t) 0;
%right boundary condition
g = @(t) 0;
%initial condition
T = @(x) exp(-5*(x-0.3).^2);

%derivative boundary condition parameters
%K = 0;      ub = 0;

%source
S = @(x,t) 0;

np=((M-1)/50);     %parameter for printing

% initial condition
u(:,1) = T(x);
figure(1)
plot(x,u(:,1));
title('Classic Method - initial condition')
hold on


for n=1:M-1
    %left boundary condition
    u(1,2) = f(t(n+1));
    
    %interior points
    for i=2:N-1
        ux = beta*(u(i+1,1)-u(i-1,1));
        uxx = rt*(u(i-1,1)-2*u(i,1)+u(i+1,1));
        cu = c*dt*u(i,1)*(1 - u(i,1));
        source = dt*(S(x(i),t(n)));
        u(i,2) = u(i,1) - ux + uxx + cu + source;
    end
    %right derivative bounday condition
    %u(N,2) = (ub*(2*dx*K)/D + 4*u(N-1,2) - u(N-2,2))/(3 + (2*dx*K)/D);
    
    %right boundary condition
    u(N,2) = g(t(n+1));
    
    %update
    u(:,1) = u(:,2);
    
    %plot
    if (mod(n,np)==0)
        plot(x,u(:,1)); 
        u(1:5,1)
        drawnow
        title('Classic Method - final plot')
    end
end
