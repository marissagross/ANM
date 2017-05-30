% ExPDE9  SOR iteration
% 0 = D(u_xx + u_yy) + au_x + bu_y + cu + S(x,y)

dx = .01; dy = .02;
x = 0:dx:1; y = 0:dy:2; 
imax = length(x); jmax = length(y);
D=2; a = .3; b = .4; c = 1;
alpha = D*(2/dx^2+2/dy^2)-c;  
S = @(x,y) .2*exp(-5*(x-.4).^2-10*(y-1.4).^2);

u = zeros(imax,jmax);

error = 10;
omega = 1.9;
itermax = 10000;
tol = 1e-2;
iter = 1;

while (iter<itermax && error>tol)
    error = 0;
    for i=2:imax-1
        for j=2:jmax-1
            T = D*((u(i-1,j)+u(i+1,j))/dx^2+(u(i,j-1)+u(i,j+1))/dy^2) ...
                + a*(u(i+1,j)-u(i-1,j))/(2*dx) + b*(u(i,j+1)-u(i,j-1))/(2*dy) ...
                + S(x(i),y(j));
            R = T/alpha - u(i,j);
            error = error + abs(R);
            u(i,j) = u(i,j) + omega*R;
        end
        if (iter==1)
           mesh(x,y,u')
           axis([0 1 0 2 0 .0001])
           pause(.02)
        end
    end
    if (iter==1) 
        pause
    end
    mesh(x,y,u')
    axis([0 1 0 2 0 .008])
    pause(.02)
    fprintf('%d  %e\n',iter,error)
    iter = iter+1;
end
mesh(x,y,u')
axis([0 1 0 2 0 .008])