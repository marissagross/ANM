A=rand(1000,1000);
b=rand(1000,1);

t=cputime;
x1=uptrbk(A,b);
z1=cputime-t;

%tdiff=z2-z1;

fprintf('z1 time: 5.5%\n',z1)
%fprintf('z2 time: 5.5%\n',z2)
%fprintf('Difference in times: 5.5%\n',tdiff)
