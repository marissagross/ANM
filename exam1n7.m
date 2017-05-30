a=1; b=2e-3; d=4e-4; f=4e-8;
xspan=[0,5];
C0=[0.063; 700; 5.6];

M = @(x,C) [-a*(C(1)^3) + d*(C(3)^4) - f*(C(2)^4)*(C(1)^4);
            d*(C(3)^4) - f*(C(2)^4)*(C(1)^4);
            a*(C(1)^3) - (b*C(3)) - d*(C(3)^4) + f*(C(2)^4)*(C(1)^4)];
        
options=odeset('AbsTol',1e-10,'RelTol',1e-10);

[X,c]=ode45(M,xspan,C0,options);

figure(1)
plot(X,c(:,1)),title('Concentration on C1');

figure(2)
plot(X,c(:,2)),title('Concentration on C(2)');

figure(3)
plot(X,c(:,3)),title('Concentration on C(3)');
