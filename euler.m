function [X,Y]=euler(f,a,b,ya,h)

X=a:h:b;
Y=zeros(1,length(X));
Y(1)=ya;
    for k=1:length(X)-1
        Y(k+1)=Y(k)+h*f(X(k),Y(k));
    end
    
end

