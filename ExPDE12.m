% ExPDE12.m
% 2nd order hyperbolic PDE
%Hyperbolic PDE: Wave Equation (with only numerical dispersion and dissipation)
% u_{tt} = c^2*u_{xx}  u(0,t)=3 u(1,t)=1 u(x,0)=3-2x u_t(x,0)=exp(-100*(x-.7)^2)

c = 3;
dx = .01;
dt = .001;
r = c*dt/dx
x = 0:dx:1;
N = length(x);
T = 0:dt:1;
M = length(T);

u1 = exp(-1000*(x-.7).^2);
figure(1)
plot(x,u1),axis([0 1 -1 1]),title('2nd order nondispersive wave eqn with some numerical dispersion')
pause
u2 = u1;
plot(x,u2),axis([0 1 -1 1]),title('2nd order nondispersive wave eqn with some numerical dispersion')
pause(.03)

for j=2:M-1
   uj(1) =0;
   uj(N) = 0;
   for i=2:N-1
      uj(i) = 2*(1-r^2)*u2(i) + r^2*(u2(i+1)+u2(i-1)) - u1(i);
   end
   plot(x,uj),axis([0 1 -1 1]),title('2nd order nondispersive wave eqn with some numerical dispersion')
   drawnow
   pause(.02)
   u1 = u2;
   u2 = uj;
end

plot(x,uj),axis([0 1 -1 1])