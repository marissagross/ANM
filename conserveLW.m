%Conservative Lax-Wendroff

L = 10;     dx = 1e-2;  x = 0:dx:L;
tmax = 3;   dt = 1e-4;  t = 0:dt:tmax;

N = length(x);
M = length(t);

u = zeros(N,2);

%flux
f = @(u) (((u+1)^2)/10 + 2*u);
fprime = @(u) (((u+1)/5) + 2);
%boundary condition
bcf = @(t) (t/2);
%initial condition
icg = @(x) (exp(-2*(x-3).^2));

np=((M-1)/10);     %parameter for printing

%plot initial condition
u(:,1)= icg(x);
figure(1)
plot(x,u(:,1)); 
title('Conservative Lax-Wendroff Method')
hold on

for n = 1:M-1
    u(1,2) = bcf(t(n+1));
    for i = 2:N-1
        Aplus = (fprime((u(i,1) + u(i+1,1))/2));
        Aminus = (fprime((u(i,1) + u(i-1,1))/2));
        c1 = (dt/(2*dx))*(f(u(i+1,1)) - f(u(i-1,1)));
        c2 = (dt^2/(2*dx^2))*(Aplus*(f(u(i+1,1)) - f(u(i,1))) - Aminus*(f(u(i,1)) - f(u(i-1,1))));
        u(i,2) = u(i,1) - c1 + c2;
    end
    %exit boundary condition
    u(N,2) = (2*u(N-1,2)) - u(N-2,2);

    %plot
    if (mod(n,np)==0)
        plot(x,u(:,2)); 
        drawnow
        title('Conservative Lax-Wendroff Method')
    end
    
    %update
    u(:,1) = u(:,2);

end