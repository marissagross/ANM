%Crank-Nicholson
D = 2;
a = -0.4;
c = 0;

L = 9;      dx = 1e-3;      x = 1:dx:L;
Tmax = 2;   dt = 1e-3;      t = 0:dt:Tmax;

N = length(x);
M = length(t);

u = zeros(N,2);

S = @(x,t) (11*exp(-20*(x-4)^2));

%boundary conditions
f = @(t) (1+t);
g = @(t) (sqrt(t));
%initial condition
T = @(x) sin(x);

np=((M-1)/10);     %parameter for printing

rt= (D*dt)/(dx^2);
beta= (a*dt)/(2*dx);
gm = ((rt/2) + (beta/2));
gc = (rt - (c*dt/2));
gp = ((rt/2) - (beta/2));

%Build matrix
AM(1)=1;
AR(1)=0;
for i=2:N-1
    AL(i)=(-gm);
    AM(i)=(1+gc);
    AR(i)=(-gp);
end
AL(N)=0;
AM(N)=1;

%plot initial condition
u(:,1)= T(x);
figure(1)
plot(x,u(:,1));
hold on

%right hand side
for n=1:M-1
    rhs(1)= f(t(n+1));
    for i=2:N-1
    rhs(i) = (dt*S(x(i),t(n)+(dt/2)) + gm*u(i-1,1) + (1-gc)*u(i,1) + gp*u(i+1,1));
    end
    rhs(N)= g(t(n+1));
    
    %call tridiagonal solver
u(:,2)=tridiag(AL,AM,AR,rhs);

    %plot
    if (mod(n,np)==0)
        plot(x,u(:,2));
    end

%update
u(:,1) = u(:,2);
    
end
    



