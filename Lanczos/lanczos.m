D=20;

for i=1:D
for j=1:i
A(i,j)=rand;
A(j,i)=A(i,j);
end
end


v(:,1)=rand(D,1);
v(:,1)=v(:,1)/norm(v(:,1));
w(:,1)=v(:,1);

b(1)=0;
d(1)=0;
w0=zeros(D,1);
v0=zeros(D,1);

for j=1:D
   a(j)=(A*v(:,j))'*w(:,j);
   if j==1
   vg(:,j+1)=A*v(:,j)-a(j)*v(:,j);
   wg(:,j+1)=A'*w(:,j)-a(j)*w(:,j);
   else
   vg(:,j+1)=A*v(:,j)-a(j)*v(:,j)-b(j)*v(:,j-1);
   wg(:,j+1)=A'*w(:,j)-a(j)*w(:,j)-b(j)*w(:,j-1);
   end
   d(j+1)=(vg(:,j+1)'*wg(:,j+1))^0.5;
   b(j+1)=(vg(:,j+1)'*wg(:,j+1))/d(j+1);
   w(:,j+1)=wg(:,j+1)/b(j+1);
   v(:,j+1)=vg(:,j+1)/d(j+1);
end

b=b(2:D);
d=d(2:D);
T=diag(a)+diag(b,-1)+diag(d,1);

%Se obtienen los mismo autovalores que lanczos2, por lo que lo considero
%inviable. Se repiten y no entiendo porque.