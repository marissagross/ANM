% ExPDE7
% elliptic PDE

% this is an example of what solutions look like
% it is NOT an example of how to solve elliptic PDEs efficiently

h = 0.1; k = 0.1;
x = h:h:1-h; y = k:k:1-k;
N = length(x); M = length(y);

b = zeros(N*M,1);


% source term
for j=1:M
   for i=1:N
      b(N*(j-1)+i,1) = -100*exp(-.10*((x(i)-.2)^2+(y(j)-.3)^2));
       %b(N*(j-1)+i,1) = b(N*(j-1)+i,1) + 400*exp(-5*(x(i)-.5)^2-5*(y(j)-.5)^2);
      % comment out the following line to include the source -- Maximum Principle no longer applies
       % b(N*(j-1)+i,1) = 0;
   end
end

% left 
i = 1;
for j=1:M
   b(N*(j-1)+i,1) = b(N*(j-1)+i,1) - 0/h^2;
end

% bottom
j = 1;
for i=1:N
   b(N*(j-1)+i,1) = b(N*(j-1)+i,1) - (-7)*(exp(x(i))-1)/(exp(1)-1)/k^2;
end

% top
j = M;
for i=1:N
   b(N*(j-1)+i,1) = b(N*(j-1)+i,1) - 5*x(i)/k^2;
end
% right
i = N;
for j=1:M
   b(N*(j-1)+i,1) = b(N*(j-1)+i,1) - (12*y(j)-7)/h^2;
end

A = zeros(N*M,N*M);
% diagonal blocks B
for j=1:M
   % j is block row
   for i=1:N
      A(N*(j-1)+i,N*(j-1)+i) = -2/h^2 - 2/k^2;
   end
   for i=1:N-1
      A(N*(j-1)+i,N*(j-1)+i+1) = 1/h^2;
   end
   for i=2:N
      A(N*(j-1)+i,N*(j-1)+i-1) = 1/h^2;
   end
end
% superdiagonal C blocks
for j=1:M-1
   for i=1:N
      A(N*(j-1)+i,N*(j)+i) = 1/k^2;
   end
end
% subdiagonal C blocks
for j=2:M
   for i=1:N
      A(N*(j-1)+i,N*(j-2)+i) = 1/k^2;
   end
end

u = A\b;

% put solution into matrix v for plotting

v = zeros((N+2),(M+2));

for j = 2:M+1
   v(1,j) = 0;       % left
   v(N+2,j) = 12*y(j-1)-7;  % right
end
for i=2:N+1
   v(i,1) = -7*(exp(x(i-1))-1)/(exp(1)-1);       % bottom
   v(i,M+2) = 5*x(i-1);  % top
end

% corners
v(1,1) = 0;
v(1,M+2) = 0;
v(N+2,1) = -7;
v(N+2,M+2) = 5;

for i=2:N+1
   for j=2:M+1
      v(i,j) = u(N*(j-2)+i-1);
   end
end

x1 = 0:h:1; y1 = 0:k:1;
surf(x1,y1,v'),title('Maximum and Minimum Values Occur on the Boundaries with no source' ), shading interp