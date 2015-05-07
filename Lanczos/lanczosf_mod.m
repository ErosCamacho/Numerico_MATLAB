function [T,q,j]=lanczosf_mod(A)
%% Inicialización de las variables
d=size(A);
D=d(1); %Tomo D como la dimensión de A.
%b son los coeficientes de la diagonal no principal
%a son los coeficientes de la diagonal principal
%q es la MATRIZ de transformacion (ortogonal) T=q'*A*q
%T es la matriz resultante
%j es el numero de iteraciones
a=zeros(D,1);
q=zeros(D,1);
b=zeros(D-1,1);
r=zeros(D,1);
T=zeros(D);
j=0;
%% Metodo de Lanczos modificado
while (max(eig(A))~=max(eig(T)) && min(eig(A))~=min(eig(T))) && (j<=D-1)
   if j==0
    r0=rand(D,1);
    b0=norm(r0);
    q(:,j+1)=r0/b0;
    a(j+1)=q(:,j+1)'*A*q(:,j+1);
   else
       if j==1 
       r(:,j)=A*q(:,j)-a(j)*q(:,j);
       else
       r(:,j)=A*q(:,j)-a(j)*q(:,j)-b(j-1)*q(:,j-1);
       end
       b(j)=norm(r(:,j));
       q(:,j+1)=r(:,j)/b(j);
       a(j+1)=q(:,j+1)'*A*q(:,j+1);   
   end
   T=diag(a)+diag(b,-1)+diag(b,1);
   j=j+1;
end
end