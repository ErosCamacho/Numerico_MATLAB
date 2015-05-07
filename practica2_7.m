clear
clc
A=[3,-1,2;-5,4,1;1,1,-6];
b=[-6;21;-14];

%DeterminanteA
detA=det(A)
%Solucionconinversa
x1=inv(A)*b
%Soluciondivmat
x2=A\b
%Comprobacion
[L,U,P]=lu(A);
B=P*b;
y=L\B;
x3=U\y