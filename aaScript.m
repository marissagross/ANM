f=@(x) exp(2*x);
a=-2;
b=4;
n=100;

[aa] = csimp(f,a,b,n);

fprintf('composite Simpsons rule: %6.10f \n',aa)