A=[4 1 -1; 1 -5 -1; 2 -1 -6];   %modified to be diagonally dominant
b=[13 -8 -2];

xo= [10 20 -30]';
tol=1.0e-10;
maxiter=5000;

[x,iter]=GaussS(A,b,xo,tol,maxiter);

fprintf('The solution to the system is %20.10e \n',x)
fprintf('The Gauss-Siedel method took %6d iterations\n',iter)