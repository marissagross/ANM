%Lax-Wendroff
a = 4; 

L = 10;     dx = 1e-2;  x = 0:dx:L;
tmax = 2;   dt = 1e-4;  t = 0:dt:tmax;

R = ((a*dt)/dx);

N = length(x);
M = length(t);

u = zeros(N,2);

%boundary condition
f = @(t) (0.4*sin(2*t));

%initial condition
g = @(x) (exp(-20*(x-3).^2));

np=((M-1)/10);     %parameter for printing

%plot initial condition
u(:,1)= g(x);
figure(1)
plot(x,u(:,1)); 
title('Lax-Wendroff Method')
hold on

for n = 1:M-1
    u(1,2) = f(t(n+1));
    for i = 2:N-1
        ux = u(i+1,1) - u(i-1,1);
        uxx = u(i-1,1) - 2*u(i,1) + u(i+1,1);
        u(i,2) = u(i,1) - R*0.5*ux + (R^2)*0.5*uxx;
    end
    u(N,2) = (2*u(N-1,2)) - u(N-2,2);

    %plot
    if (mod(n,np)==0)
        plot(x,u(:,2)); 
        drawnow
        title('Lax-Wendroff Method')
    end
    
    %update
    u(:,1) = u(:,2);

end