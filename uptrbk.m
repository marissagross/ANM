function X = uptrbk(A,B)
N = size(A,1);
X = zeros(N,1);
Aug = [A B]; % augmented matrix
for p=1:N-1
   [~,j] = max(abs(Aug(p:N,p))); % choosing the pivots of largest absolute value
   C = Aug(p,:); % save p in temp. vector c
   Aug(p,:) = Aug(j+p-1,:); % rewrite p with j
   Aug(j+p-1,:) = C; % rewrite j with c
   if Aug(p,p)==0
      disp('A was singular.  No unique solution')
      return
   end
   for k=p+1:N
      m = Aug(k,p)/Aug(p,p); % multiplier m_(kp)
      Aug(k,p:N+1) = Aug(k,p:N+1)-m*Aug(p,p:N+1); % R_k  = R_k - m_(kp)R_p
   end
end

X = backsub(Aug(1:N,1:N),Aug(1:N,N+1));