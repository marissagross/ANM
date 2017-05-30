%Conservative Richtmeyer 

L = 10;     dx = 0.01;  x = 0:dx:L;
tmax = 2;   dt = 1e-4;  t = 0:dt:tmax;

N = length(x);
M = length(t);

u = zeros(N,2);

%flux
f = @(u) (u - ((4-u)^3)/3);
fprime = @(u) (u^2 -8*u +17);
%boundary condition
bcf = @(t) 0;
%initial condition
icg = @(x) (4*exp(-5*(x-3).^2));

np=((M-1)/50);     %parameter for printing

%plot initial condition
u(:,1)= icg(x);
figure(1)
plot(x,u(:,1)); 
title('Conservative Richtmeyer Method')
hold on

for n = 1:M-1
    u(1,2) = bcf(t(n+1));
    for i = 2:N-1
        uplus = (u(i,1) + u(i+1,1))/2;
        uminus = (u(i,1) + u(i-1,1))/2;
        c1 = (dt/(2*dx))*(f(u(i+1,1)) - f(u(i,1)));
        c2 = (dt/(2*dx))*(f(u(i,1)) - f(u(i-1,1)));
        A = uplus - c1;
        B = uminus - c2;
        u(i,2) = u(i,1) - (dt/dx)*(f(A) - f(B));
    end
    u(N,2) = (2*u(N-1,2)) - u(N-2,2);

    %plot
    if (mod(n,np)==0)
        plot(x,u(:,2)); 
        drawnow
        title('Conservative Richtmeyer Method')
    end
    
    %update
    u(:,1) = u(:,2);

end