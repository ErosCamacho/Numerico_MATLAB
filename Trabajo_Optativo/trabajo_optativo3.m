%% COMPARACION ENTRE LOS DOS PROBLEMAS

format long

%% Defino la funcion f del primer problema
f1=@(t,y,k,m)(k*y*(m-y));

% Inicializo algunos parametros dados.
k=2*10^(-6);
m=1*10^5;
y0=1000;

% Introduzco los limites de contorno y el numero de iteraciones.
a=0;
b=30;
n=30;

%Utilizo el metodo Runge-Kutta de orden 4
[t1,y1]=RK4_to(f1,a,b,y0,n,k,m);

%Calculo la cantidad de poblacion sana
x1=m-y1;

%% Defino la funcion f del segundo problema
f2=@(t,z,k1,k2,m,x0)(k2*(m-z-x0*exp(-(k1/k2).*z)));

% Inicializo algunos parametros dados.
k1=2*10^(-6);
k2=10^(-4);
m=1*10^5;
z0=0;
y0=1000;
x0=m-y0-z0;

% Introduzco los limites de contorno y el numero de iteraciones.
a=0;
b=30;
n=50;

%Utilizo el metodo de heun
[t2,z]=heunsis_to(f2,a,b,z0,n,k1,k2,m,x0);

%Calculo la cantidad de poblacion sana y de infectados
x2=x0*exp(-(k1/k2)*z);
y2=m-x2-z;

%Represento los valores obtenidos
figure(1);
hold on 
plot(t1,x1,'g');
plot(t1,y1,'r');
plot(t2,x2,'y');
plot(t2,y2,'b');

% Pongo etiquetas a la grafica.
title('Comparacion Pob. infectada/sana frente al tiempo')
leyenda='Sanos sin eliminacion     ';
leyenda=[leyenda;'Infectados sin eliminacion'];
leyenda=[leyenda;'Sanos con eliminacion     '];
leyenda=[leyenda;'Infectados con eliminacion'];
legend(leyenda);
xlabel('Tiempo(dias)');
ylabel('Poblacion');


