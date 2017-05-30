f=@(x)(exp(-4*x)-sin(x));
a=1;
b=5;
tol=10e-10;
 
[root,iter]=BisectionMethod(f,a,b,tol);
 
fprintf('The root is %20.10e \n',root)
fprintf('It took %6d iterations to find the root \n',iter)
