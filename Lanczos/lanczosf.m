function [T,q]=lanczosf(A)
%% Inicialización de las variables
d=size(A); 
D=d(1); %Tomo D como el valor de la dimensión de A.
%b son los coeficientes de la diagonal no principal
%a son los coeficientes de la diagonal principal
%q es la MATRIZ de transformacion (ortogonal) T=q'*A*q
%Inicializo las variables.
a=zeros(D,1);
q=zeros(D,1);
b=zeros(D-1,1);
r=zeros(D,1);

%% Metodo de Lanczos
for j=0:D-1
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
end
T=diag(a)+diag(b,-1)+diag(b,1); %Creacion de la matriz tridiagonal
end