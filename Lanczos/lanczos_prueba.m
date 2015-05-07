clear 
clc
format short
%% Inicialización
u=1;
for val=500:500:3000
e=val; %e es la dimension
A=ones(e);    
%Creamos una matriz de dimensión e
for i=1:e
for r=1:i
A(i,r)=rand;
A(r,i)=A(i,r);
end
end

%Descomentar para utilizar

%% Método de Lanczos modificado

%[T,q,j]=lanczosf_mod(A);
%iteraciones=j;

%% Método de Lanczos

tic;
[T,q]=lanczosf(A);
tiempo(u)=toc;

%autoval=[eig(A),eig(T)];

%titulo=['Autovalores de A ',' Autovalores de T'];

%ensenar1=[autoval(1971:2000,1),autoval(1971:2000,2)];
%ensenar2=[autoval(1:30,1),autoval(1:30,2)];

%ensenar=[ensenar2,ensenar1];

%% Método de Lanczos con iteraciones 
%clear T q j
%format long
%iteraciones
%tic;
%[T,q]=lanczosf2(A,iteraciones);
%toc;
u=u+1;
end


