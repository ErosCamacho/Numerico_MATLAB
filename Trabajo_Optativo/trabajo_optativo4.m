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
plot(tt,yy,'k');

% Represento la solucion utilizando metodos numericos.
% Ha sido necesaria una simple modificacion del Metodo de 
% Runge-Kutta de orden 4 ya que tuve que introducir una funcion 
% de 4 variables.

% Introduzco los limites de contorno y el numero de iteraciones.
a=0;
b=30;
color=['g','r','y','m','c','b'];
n=[2,10,15,20,30,50];
for i=1:6
[t,y]=RK4_to(f1,a,b,y0,n(i),k,m);

% Represento el resultado obtenido.
hold on
plot(t,y,color(i));
end
% Pongo etiquetas a la grafica.
title('Numero de infectados frente al tiempo')
legend('Solucion analitica', 'Solucion numerica');
xlabel('Tiempo(dias)');
ylabel('Numero de infectados');
