%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% This script numerically solves 2nd-order ODE
% 
% d^2y/dt^2 = -eps/(1+y)^2, y(0)=0, dy/dt(0)=eps
%
% and then plots the solution.
%
% The right-hand side of the equation is defined in 
% the matlab function file 'rhs_projectileB.m'. 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
global l;     % Set the value of epsilon.
 
l=2;
 
init1 = [3.4 0];
init2 = [5 0];
init3 = [1 0];  % Set the initial condition of the ODE. 
t = [0 50];     % Define the time interval over which solution will be computed.  
                  % You may need to change the right end point to see the long-term
                  % behavior of the solution, depending on epsilon. 
 
 
% Set some options used in the next command.  Do not worry about this for now.
options = odeset('RelTol',1e-8, 'AbsTol',1e-8);
 
%% Numerically solve the equation.  See 'ode45' in matlab help for more info on this commmand. 
[T1,Y1] = ode45(@rhs_projectileB,t,init1,options);
[T2,Y2] = ode45(@rhs_projectileB,t,init2,options);
[T3,Y3] = ode45(@rhs_projectileB,t,init3,options);
% Plot the solution. 
 
% position
figure(1)
%plot(T1,Y1(:,1),T1,Y1(:,2),T2,Y2(:,1),T2,Y2(:,2),T3,Y3(:,1),T3,Y3(:,2))
plot(T1,Y1(:,1),T1,Y1(:,2),T2,Y2(:,1),T2,Y2(:,2))
hold on
% See 'colon' in matlab help for why we use 'Y(:,1)' here.  
title([' '])
%ylim([0,1.2])
 
 
%velocity
%subplot(2,1,2)
%set(gca,'FontSize',24)
%plot(T,Y(:,2))
%title(['y'' versus tau, eps=', num2str(eps)])
 
% To save the plots for printing, uncomment the following line.
 
%saveas(gcf,'eps2.pdf');
