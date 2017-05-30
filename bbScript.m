f=@(x) (x^3-3*x^2+2);
a=2;
b=4;
n=100;

[bb] = csimp(f,a,b,n);

fprintf('composite Simpsons rule: %6.10f \n',bb)