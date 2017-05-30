f=@(x)(1800*log(160000/(160000-2600*x))-9.812*x-750);
a=50;
b=-50;
tol=10e-10;
 
[root,iter]=BisectionMethod(f,a,b,tol);
 
fprintf('The root is %20.10e \n',root)
fprintf('It takes %20.10e seconds for the rocket to reach a velocity of 750 meters per second \n',root)
fprintf('It took %6d iterations to find the root \n',iter)

