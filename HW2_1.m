x0=2; 
x1=x0+h; 
x2=x0+2*h; 

x=x1;
h=h;

L20=@(x) ((x-x1).*(x-x2))./(2.*h^2);
L21=@(x) ((x-x0).*(x-x2))./(-h^2);
L22=@(x) ((x-x0).*(x-x1))/(2.*h^2);

f=@(x) (P2);

y0=f(x0);
y1=f(x1);
y2=f(x2);

P2=@(x) ((y0.*L20(x))+(y1.*L21(x))+(y2.*L22(x)));

fprintf('The second order central difference formula: \n',P2)


