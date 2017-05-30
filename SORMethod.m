function SORMethod

xmax = 5;     dx = 0.01;      x = 0:dx:xmax;
ymax = 4;     dy = 0.01;      y = 0:dy:ymax;
alpha = ((2/dx^2) + (2/dy^2));

N = length(x);
M = length(y); 
u = zeros(N,M);     %initial guess u(i,j)=0

mmax = 4000;    tol = 100;     omega = 1.95;
m = 1;    err = (2*tol);

S = @(x,y) (-800*exp(-10*((x-1)^2 + (y-2)^2)));

%boundary conditions
F = @(y) (50-y);    %left boundary
%G(x) bottom boundary
function z=G(x)
    z = (50+x);
    if (1<=x && x<=3)
        z=100;
    end
end
H = @(y) (50+2*y);  %right boundary
Q = @(x) (50-3*x);  %top boundary


while (m < mmax && err > tol)
    err = 0;
    %boundary conditions at bottom: j=1
    u(1,1) = (1/2)*(F(y(1)) + G(x(1))); %bottom left corner
    for i=2:N-1
        u(i,1) = G(x(i));   %bottom
    end
    u(N,1) = (1/2)*(G(x(N)) + H(y(1))); %bottom right corner
    
    for j=2:M-1
        u(1,j) = F(y(j));   %boundary conditions on left side
        for i=2:N-1
            Tdx = ((1/dx^2)*(u(i-1,j)+u(i+1,j)));
            Tdy = ((1/dy^2)*(u(i,j-1)+u(i,j+1)));
            T = (Tdx + Tdy - S(x(i),y(j)))/alpha;
            R = T - u(i,j);
            err = err + abs(R);
            u(i,j) = u(i,j) + R*omega;
        end
        u(N,j) = H(y(j));   %boundary conditions on right side
    end
    
    %boundary conditions at top: j=M
    u(1,M) = (1/2)*(F(y(M)) + Q(x(1))); %top left corner
    for i=2:N-1
        u(i,M) = Q(x(i));   %top
    end
    u(N,M) = (1/2)*(Q(x(N)) + H(y(M))); %top right corner
    
    m = m+1;
    
    fprintf('%d %e\n',m,err)
    if (mod(m,2)==0)
        mesh(x,y,u')
        drawnow
    end
    
end   %ends while loop

surf(x,y,u')

end