f=@(x) sqrt(2+5*x);
a=2;
b=7;
A=[(-sqrt(3/5)) sqrt(3/5) 0];
W=[(5/9) (8/9) (5/9)];


[gQ] = gaussQuad(f,a,b,A,W);

fprintf('Gaussian 3-point Quadrature: %6.10f \n',gQ)