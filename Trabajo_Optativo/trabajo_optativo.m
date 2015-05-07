clear 
clc
%% Primera Parte
% Individuos contagiados que no se recuperan
format long
f1=@(t,y,k,m)(k*y*(m-y)); %Defino la funcion f

% Inicializo algunos parametros
k=2*10^(-6);
m=1*10^5;
y0=1000;

% Represento la solucion utilizando metodos analiticos
g=inline('m./(1-C*exp(-m*k*t))');
C=(y0-m)/y0;
tt=0:0.1:30;
yy=g(C,k,m,tt);
figure(1);
hold on
plot(tt,yy,'-k');

%Represento la solucion utilizando metodos numericos
%Ha sido necesaria una simple modificacion del Metodo de Runge-Kutta de
%orden 4 ya que tuve que introducir una funcion de 4 variables.
a=0;
b=30;
n=100;
[t,y]=RK4_to(f1,a,b,y0,n,k,m);

hold on
plot(t,y);

%% Segunda Parte
%Individuos contagiados que se pueden curar o simplemente mueren.
k1=2*10^(-6);
k2=10^(-4);
n=20;
x0=m-y0;
z0=0;
f2=@(t,z,k1,k2,m,x0)(k2*(m-z-x0*exp(-(k1/k2).*z)));
[t2,z]=heunsis_to(f2,a,b,z0,n,k1,k2,m,x0);
figure(2);
hold on
%plot(t,z);
x=x0*exp(-(k1/k2)*z);
%plot(t,x,'-y');
y2=m-x-z;
plot(t,y)
plot(t2,y2,'-r');
legend('Eliminados','Sanos','Enfermos');


%% EBOLA
dias=[239,234,232,219,215,212,206,204,200,197,193,190,185,183,181,176];
dias=[dias,168,162,156,151,149,147,144,142,140,137,135,132,130,127,123,120];
dias=[dias,117,114,112,108,106,102,100,90,87,75,68,66,62,57,51,33,30,26,25];
dias=[dias,23,19,16,10,9,5,4,2,0];

infec=[15145,14413,14098,12567,10703,9936,9216,8997,8399,8033];
infec=[infec,7492,7178,6574,6263,5864,5347,4293,3707,3071,2615];
infec=[infec,2473,2240,2127,1975,1848,1779,1711,1603,1440,1323];
infec=[infec,1201,1093,1048,982,964,888,844,779,759,599,528,452,337,309];
infec=[infec,270,265,260,253,242,230,224,194,183,167,135,130,103,86,86,49];

figure(3);
hold on
plot(dias,infec,'o');
a=0;
b=220;
y0=49;
n=100;
%Si multiplico por 2 la poblacion divido entre 2 k
pob=19000000;
k=1.37*10^(-9);
[t,y]=RK4_to(f1,a,b,y0,n,k,pob);
plot(t,y,'g');




