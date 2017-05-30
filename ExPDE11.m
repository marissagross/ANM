% ExPDE11.m
% advection eqn

h = .01;
x = 0:h:1; N = length(x);
t = 0:h:1; M = length(t);
u = zeros(101,101);

for i = 2:101
   for j = 1:102-i
      u(i+j-1,j) = exp(-3*x(i));
   end
end
for i=1:102-j
   for j = i:101
      u(i,j) = 2 + (sin(5*t(j-i+1))).^2;
   end
end

figure(1)
mesh(x,t,u'),xlabel('x'),ylabel('t'),title('Advection Eqn Example - exact solution')

u=zeros(101,201);
dx = .01;
dt = dx/2;
t = 0:dt:1;
u(:,1) = exp(-3*x);
for j=2:201
    tj = (j-1)*dt;
    u(1,j) = 2 + (sin(5*tj))^2;
    for i=2:100
        u(i,j) = u(i,j-1) - dt/dx*(u(i,j-1)-u(i-1,j-1));
    end
    u(101,j) = 2*u(100,j)-u(99,j);
end

figure(2)
mesh(x,t,u'),xlabel('x'),ylabel('t'),title('Advection Eqn Example - numerical solution')
