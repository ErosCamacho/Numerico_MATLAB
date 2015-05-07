clear
clc
format short
D=10;
A=ones(D);
%tiempo_inicio = cputime;
tic;
%Creamos una matriz de dimensión D
for i=1:D
for j=1:i
A(i,j)=rand;
A(j,i)=A(i,j);
end
end

%b son los coeficientes de la diagonal no principal
%a son los coeficientes de la diagonal principal
%q es la MATRIZ de transformacion (ortogonal) T=q'*A*q
a=zeros(D,1);
q=zeros(D,1);
b=zeros(D-1,1);
r=zeros(D,1);

%Lanczos para encontrar la matriz trigiagonal con los mismo autovalores.
for j=0:D-1
    %j
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
   
   %vector2=[max(eig(A)),max(eig(T));min(eig(A)),min(eig(T))];
   %vector2
end

%T=q'*A*q Produce errores de redondeo, por lo que no es viable

T=diag(a)+diag(b,-1)+diag(b,1);%Debido a que se producen errores en el
                                %me veo en la obligacion de forzar la 
                                %forma de la matriz.

                              

%total= cputime - tiempo_inicio;
toc;



vector=[eig(A),eig(T)];

%Metodo que vamos a utilizar, por mas que he buscado no he podido encontrar
%el óptimo.

%Este método te permite encontrar rápidamente los autovalores de una
%matriz, estudiando los autovalores de otra matriz asociada. Estos
%autovalores generalmente son el mayor y el menor.

