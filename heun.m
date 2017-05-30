function [X,Y]=heun(f,a,b,ya,h)

X=a:h:b;
Y=zeros(1,length(X));
Y(1)=ya;
    for k=1:length(X)-1
        Q=f(X(k),Y(k));
        P=Y(k)+h*Q;
        Y(k+1)=Y(k)+h/2*(Q+f(X(k+1),P));
    end
    
end

