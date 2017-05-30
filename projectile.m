function projectile

% projectile.m
% Kreider, 2/16
% F=ma for projectile under gravitational influence of 2 bodies

G = 6.67408e-11; % universal grav constant, m^3/kg/s^2
M1 = 6.23e23; % Mars, kg
M2 = 1.898e27; % Jupiter, kg
x1 = 1e5; % m, arbitrary position of Mars
y1 = 1e4;

icase = 4;
switch icase
    case 1    
        x2 = 1.5e5; 
        y2 = 1.5e5;  
        Y0 = [0 7e2 0 1e2]';
    case 2
        x2 = 1.5e5; 
        y2 = 1.5e5;  
        Y0 = [0 7e2 0 1e4]';
    case 3
        x2 = 1.1e5; 
        y2 = 4e4;  
        Y0 = [0 7e2 0 1e2]';
    case 4
        x2 = 1.5e5; 
        y2 = 4e4;  
        Y0 = [0 7e2 0 1e4]';
end
tspan = [0 300];
tol = 1e-6;
options = odeset('AbsTol',tol,'RelTol',tol);
[T,Y] = ode45(@rhs,tspan,Y0,options);
N = length(T)
% figure(1)
% hold on
% plot(x1,y1,'o')
% plot(x2,y2,'o')
% plot(Y(1:N/4,1),Y(1:N/4,3),'k')
% pause
% plot(Y(N/4:N/2,1),Y(N/4:N/2,3),'r')
% pause
% plot(Y(N/2:3*N/4,1),Y(N/2:3*N/4,3),'b')
% pause
% plot(Y(3*N/4:N,1),Y(3*N/4:N,3),'g')

figure(2)
hold on
axis([0 18e4 -1e5 1.5e5])
plot(x1,y1,'o')
plot(x2,y2,'o')
for i=1:10:N-10
    plot(Y(i:i+10,1),Y(i:i+10,3),'k')
    drawnow
end

function out = rhs(t,R)
% R(1) = x, horizontal position
% R(2) = x', horizontal velocity
% R(3) = y, vertical position
% R(4) = y', vertical velocity

out = zeros(4,1);

D1 = sqrt( (R(1)-x1).^2 + (R(3)-y1).^2 );
D2 = sqrt( (R(1)-x2).^2 + (R(3)-y2).^2 );

out(1) = R(2);
out(2) = -G*M1*(R(1)-x1)/D1^3 - G*M1*(R(1)-x2)/D2^3;
out(3) = R(4);
out(4) = -G*M1*(R(3)-y1)/D1^3 - G*M1*(R(3)-y2)/D2^3;
end

end