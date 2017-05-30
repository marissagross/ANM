function [x] = uptkbk(A,b)

N=length(b);

Aug[A,b];   %This is the augmented matrix
x=zeros(N,1);   %solution
c=zeros(1, N+1);    %auxillary row for pivoting

for p=1:N-1     %partial pivoting
    [y,j]=max(abs(Aug(p:N,p)));     %interchange ros p and j+p-1
    c=Aug(p,:);  %copy row p
    Aug(p,:)=Aug(j+p-1);
    Aug(j+p-1,:)=c;
    
    for k=p+1:N
        m=Aug(k,p)/Aug(p,p);
        Aug(k,p:N+1)=Aug(k,p:N+1)-m*Aug(p,p:N+1);   %Rk-mkpRp to Rk
    end
end    %Now we have upper triangular
x=backsub(Aug(:,1:N), Aug(:,N+1));
    

end

 