%% CASO PRACTICO : ENFERMEDAD DEL EBOLA

% Inicializo los valores del tiempo en dias proporcionados
% por la tabla de la OMS.
dias=[239,234,232,219,215,212,206,204,200,197,193,190,185,183];
dias=[dias,181,176,168,162,156,151,149,147,144,142,140,137,135];
dias=[dias,132,130,127,123,120,117,114,112,108,106,102,100,90];
dias=[dias,87,75,68,66,62,57,51,33,30,26,25,23,19,16,10,9,5,4];
dias=[dias,2,0];

% Inicializo los valores de personas infectadas proporcionados
% por la tabla de la OMS
infec=[15145,14413,14098,12567,10703,9936,9216,8997,8399,8033];
infec=[infec,7492,7178,6574,6263,5864,5347,4293,3707,3071,2615];
infec=[infec,2473,2240,2127,1975,1848,1779,1711,1603,1440,1323];
infec=[infec,1201,1093,1048,982,964,888,844,779,759,599,528];
infec=[infec,452,337,309,270,265,260,253,242,230,224,194,183];
infec=[infec,167,135,130,103,86,86,49];

% Represento los valores anteriores en una grafica.
figure(1);
hold on
plot(dias,infec,'o');

% Vuelvo a crear la solucion numerica que vimos en el primer
% apartado.

% Para ello, primero defino la funcion del termino
% independiente de la ode.
f1=@(t,y,k,m)(k*y*(m-y));

% Inicializo algunos parametros dados
k=1.37*10^(-9);
m=19*10^(6);
y0=49;

% Introduzco los limites de contorno y el numero de iteraciones.
a=0;
b=220;
n=50;

% Llamo a la funcion Runge-Kutta de orden 4.
[t,y]=RK4_to(f1,a,b,y0,n,k,m);

%Represento los valores obtenidos
plot(t,y,'r');

% Pongo etiquetas a la grafica.
title('Infectados por ebola')
legend('Infectados (OMS)', 'Infectados (Numerico)');
xlabel('Tiempo(dias)');
ylabel('Numero de infectados');