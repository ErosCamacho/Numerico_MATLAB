clear
clc
A=[4,2,-2;-2,0,2;2,2,4];
%CondicionNecesariaySuficiente
for k=1:3 
    B=A(1:k,1:k);
    det(B)
end
%ObtencionLU
[L,U]=lu(A);
L
U

%Permutacion
C=[2,2,4;-2,0,2;4,2,-2];
for i=1:3
   D=C(1:i,1:i);
   det(D)
end
[L,U]=lu(C);
L
U
%Como la condicion NyS para que se realice la factorización LU es que los 
%determinantes sean distintos de 0, la realiza normalmente. Pero lo que 
%MATLAB hace es pivotaje, aunque no es necesario, para disminuir los
%errores de redondeo tomando como pivotes los coeficientes mayores.