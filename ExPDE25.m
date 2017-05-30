% ExPDE25.m
% hyperbolic equation with smooth profile
% Lax-Wendroff

dx = 1e-2;
dt = 1e-5;
x = 0:dx:10;
t = 0:dt:1;
N = length(x);
nmax = length(t);
np = (nmax-1)/100;

u2 = zeros(N,2);

a = 30; % wave speed
f = @(t) sin(10*t); % BC
g = @(x) exp(-50*(x-4).^2); % IC

R = a*dt/dx

% IC
u2(:,1) = g(x);
figure(1)
plot(x,u2(:,1),'r')
axis([0 10 -1.2 1.2])
legend('Lax-Wendroff')
pause

for n=1:nmax-1
    u2(1,2) = f(t(n+1));
    for i=2:N-1
        R = a*dt/dx;
        uxx = u2(i-1,1)-2*u2(i,1)+u2(i+1,1);
        ux = u2(i+1,1)-u2(i-1,1);
        u2(i,2) = u2(i,1) - .5*R*ux + .5*R^2*uxx;
    end
    u2(N,2) = 2*u2(N-1,2) - u2(N-2,2);
    if (mod(n,np)==0)
        plot(x,u2(:,2))
        legend('Lax-Wendroff')
        axis([0 10 -1.2 1.2])
        fprintf('%d\n',n)
        pause
    end
    u2(:,1) = u2(:,2);
end