function [x,k] = jacobi(A,b,xo,tol,maxiter)
%This function uses the jacobi method to solve a system of equations
%NOTE: works best when the system is diagonally dominant

N=length(b);
xk=zeros(N,1);
xkminus1=xo;

for k=1:maxiter
    for j=1:N
        xk(j)=(b(j)-A(j,[1:j-1,j+1:N])*xkminus1([1:j-1,j+1:N]))/A(j,j);
    end
    
    abserr=(norm(xk-xkminus1));
    relerr=(abserr/norm(xk)+eps);
    
        if (abserr<tol) && (relerr<tol)
            x=xk;
            return
        end
    xkminus1=xk;    %the update
end
end

