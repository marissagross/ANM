f=@(x) (x.^3-.001*x.^2+x-.001);
xo=49;
xone=50;
tol=1.0e-10;
maxiter=1000;

[root,iter] = secant(f,xo,xone,tol,maxiter);

fprintf('The root is %20.10e \n',root)
fprintf('It took %6d iterations to find the root \n',iter)