%% METODO DE EULER MEJORADO O DE HEUN
function [t,z]=heunsis_to(f,a,b,z0,n,k1,k2,m,x0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Aproxima la solucion de un PVI para un sistema de EDOs
% usando el metodo de Euler Mejorado o de Heun
% z'=F(t,z,k1,k2,m,x0) t en [a,b]; z(a)=z0
%% Datos
% -----
% * f = funcion vectorial del sistema escrita como vector 
%       columna para que siga la misma nomenclatura que los 
%       ode**
% * a = punto inicial
% * b = punto final
% * z0 = vector columna valor de la solucion en x=a
%        para que siga la misma nomenclatura que los ode**
% * n = numero de pasos para llegar a b
% * k1 = tasa de infeccion
% * k2 = constante de eliminacion de individuos
% * m = poblacion total
% * x0 = valor de la variable x en t=0
%% Resultado
% ---------
% * t = vector columna con los puntos donde se calcula la 
%       solucion
% * z = matriz de valores aproximado del vector solucion
% en los puntos t.
% Cada columna tiene las aproximaciones que va tomando la 
% funcion z, en cada punto que se encuentra en la variable t.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Se inicializa la variable h que van a ser los incrementos de 
% distancia en la variable t.
h=(b-a)/n; 
% Como son z0 es un sistema matricial, necesitamos su longitud 
% para asi inicializar la variable y como una matriz llena de 0.
len=length(z0);
% Se inicializa el vector columna t.
t=zeros(n+1,1); 
% Se inicializa la matriz z.
z=zeros(n+1,len); 
% Se coloca en la matriz la condicion inicial de z.
z(1,:)=z0'; 
% Se coloca la condicion inicial en el vector t.
t(1)=a;
% Creo la variable l, para que en cada iteracion no se tenga que 
% calcular h/2 de nuevo aumentando la velocidad de procesamiento
l=h/2; 
for i=1:n
% Coloco aqui el incremento de t de para ahorrarme el
% escribirlo dos veces, en la siguiente linea.
t(i+1)=t(i)+h; 
% Metodo de Heun.
p1=f(t(i),z(i,:),k1,k2,m,x0)';
p2=f(t(i)+h,z(i,:)+h*p1,k1,k2,m,x0)';
z(i+1,:)=z(i,:)+l*(p1+p2); 
end