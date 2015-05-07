clear
clc
A=[9,1,-2,1;0,8,1,1;-1,0,7,0;1,0,0,1];
A
%CALCULADOS A MANO
%POR FILAS

%function []=circulo(radio,posx,posy,color)
figure(3);
hold on
grid on
circulo(4,9,0,'b');
circulo(2,8,0,'r');
circulo(1,7,0,'g');
circulo(1,1,0,'y');
%Puede observarse como los autovalores estan contenidos en estos círculos,
%en particular el primer autovalor que se encuentra en el círculo aislado.

%POR COLUMNAS
figure(4);
hold on
grid on
circulo(3,7,0,'g');
circulo(2,9,0,'b');
circulo(1,8,0,'r');
circulo(2,1,0,'y');
%Al igual que en el caso anterior puede observarse como estos círculos 
%engloban los autovalores correspondientes.

autovalores=eig(A);
fprintf('Autovalores \n');
fprintf('%f \n',autovalores);


%UTILIZANDO LA FUNCION GERSCHGORIN.M
gershcircles(A);

