g=@(x)((1/x)*(sin(x)+(1/x)*(cos(x)-1)));
xo=1;
tol=10e-10;
maxiter=1000;
 
[root,iter]=fixpoint(g,xo,tol,maxiter);
 
fprintf('The root is %20.10e \n',root)
fprintf('It took %6d iterations to find the root \n',iter)