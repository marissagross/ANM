%hw5n2 

tspan = [0 3000];
tol = 1e-5;     
mu=1000;
options = odeset('AbsTol',tol,'RelTol',tol);
y0 = [1 1]';

f = @(t,y) [y(2); mu*(1-(y(1)^2))*y(2)-y(1)];

%disp('Using ode45')
%z1 = cputime;
%[T1,Y1] = ode45(f,tspan,y0,options);
%z2 = cputime;
%fprintf('CPU time: %f seconds. Number of steps: %d\n',z2-z1,length(T1))

disp('Using ode23s')
z1 = cputime;
[T2,Y2] = ode23s(f,tspan,y0,options);
z2 = cputime;
fprintf('CPU time: %f seconds. Number of steps: %d\n',z2-z1,length(T2))

figure(1)
plot(T1,Y1(:,1),T2,Y2(:,1)),title('Solution for y1')
legend('ode45','ode23s')
