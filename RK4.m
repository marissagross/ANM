function [X,Y]=RK4(f,a,b,ya,h)

X=a:h:b;
Y=zeros(1,length(X));
Y(1)=ya;
    for k=1:length(X)-1
        F1 = f(X(k),Y(k));
        F2 = f(X(k)+h/2,Y(k)+(h/2)*F1);
        F3 = f(X(k)+h/2,Y(k)+(h/2)*F2);
        F4 = f(X(k+1),Y(k)+h*F3);
        
        Y(k+1)=Y(k)+(h/6)*(F1+2*F2+2*F3+F4);
    end 
end

