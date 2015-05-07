clear
clc
A=[6,2,5;2,2,3;5,3,6];
format short

%APARTADO A
polinomio=poly(A);
polinomio

raices=roots(polinomio);
raices

%APARTADO B
[autovectores,autovalores]=eig(A);
autovalores=diag(autovalores)
autovectores

%APARTADO C
toler=10^-14;
maxiter=1000;
z=ones(3,1);
[z,lambda,niter,error]=potencia(A,z,toler,maxiter);
fprintf('\n Autovalor maximo con M. de la potencia: %f \n',lambda);

%APARTADO D
z=ones(3,1);
[z,lambda,niter,error]=potenciainvmenor(A,z,toler,maxiter);
fprintf('\n Autovalor minimo con M. de la potencia inv: %f \n',lambda);