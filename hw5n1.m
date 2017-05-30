k=491;
a=0.5;  b=1e-5;
tspan=[0,70];
P0=1000;

f = @(t,P) (a*P - b*(P^2) - k);

options=odeset('AbsTol',1e-5,'RelTol',1e-5);

[T,P]=ode45(f,tspan,P0,options);

figure(1)
plot(T,P,'b')
legend('k=490')
title('The Population of Salmon')