%% ENFERMEDAD SIN ELIMINACION DE LA POBLACION

format long

% Defino la funcion f, que corresponde al termino independiente 
% de la EDO.
f1=@(t,y,k,m)(k*y*(m-y));

% Inicializo algunos parametros dados.
k=2*10^(-6);
m=1*10^5;
y0=1000;

% Represento la solucion utilizando metodos analiticos.
g=inline('m./(1+C*exp(-m*k*t))');
C=(m-y0)/y0;
tt=0:0.1:30;
yy=g(C,k,m,tt);
figure(1);
hold on
plot(tt,yy,'b');

% Represento la solucion utilizando metodos numericos.
% Ha sido necesaria una simple modificacion del Metodo de 
% Runge-Kutta de orden 4 ya que tuve que introducir una funcion 
% de 4 variables.

% Introduzco los limites de contorno y el numero de iteraciones.
a=0;
b=30;
n=30;

% Llamo a la funcion Runge-Kutta de orden 4
[t,y]=RK4_to(f1,a,b,y0,n,k,m);

% Represento el resultado obtenido.
hold on
plot(t,y,'r');

% Pongo etiquetas a la grafica.
title('Numero de infectados frente al tiempo')
legend('Solucion analitica', 'Solucion numerica');
xlabel('Tiempo(dias)');
ylabel('Numero de infectados');

% A continuacion, represento cada solucion por separado 
% insertando en cada grafica las personas que se encuentran 
% infectadas y las que aun se encuentran sanas.

% Primero para los resultados analiticos.
xx=m-yy;
figure(2);
hold on
plot(tt,xx,'g');
plot(tt,yy,'r');

title('Poblacion infectada/sana frente al tiempo (analitica)')
legend('Personas sanas', 'Personas contagiadas');
xlabel('Tiempo(dias)');
ylabel('Poblacion');

% Por ultimo, para los resultados numericos.
x=m-y;
figure(3);
hold on
plot(t,x,'g');
plot(t,y,'r');

title('Poblacion infectada/sana frente al tiempo (numerica)')
legend('Personas sanas', 'Personas contagiadas');
xlabel('Tiempo(dias)');
ylabel('Poblacion');
