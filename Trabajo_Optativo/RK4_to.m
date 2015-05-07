%% METODO DE RUNGE-KUTTA DE ORDEN 4
function [x,y]=RK4_to(f,a,b,y0,n,k,m)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Aproxima la solucion de un PVI para un sistema de EDOs
% usando el metodo de Runge-Kutta de orden 4
% Y'=F(x,Y,k) x en [a,b]; Y(a)=Y0
%% Datos
% -----
% * f = funcion vectorial del sistema escrita como vector 
%       columna para que siga la misma nomenclatura que los 
%       ode**
% * a = punto inicial
% * b = punto final
% * y0 = vector columna valor de la solucion en x=a
% para que siga la misma nomenclatura que los ode**
% * n = numero de pasos para llegar a b
% * k = parametro de infeccion
%% Resultado
% ---------
% * x = vector columna con los puntos donde se calcula la 
%       solucion
% * y = matriz de valores aproximado del vector solucion
% en los puntos x.
% Cada columna tiene las soluciones que va tomando la funcion Y,
% en cada punto de la variable X.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Se inicializa la variable h que van a ser los incrementos de 
% distancia en la variable X.
h=(b-a)/n; 
% Como son Y0 es un sistema matricial, necesitamos su longitud 
% para asi inicializar la variable y como una matriz llena de 0.
s=length(y0);
% Se inicializa el vector columna X.
x=zeros(n+1,1); 
% Se inicializa la matriz Y.
y=zeros(n+1,s); 
% Se coloca en la matriz la condicion inicial de Y.
y(1,:)=y0';
% Se coloca la condicion inicial en el vector X.
x(1)=a; 
% Creo la variable l, para que en cada iteracion no se tenga que 
% calcular h/2 de nuevo aumentando la velocidad de procesamiento
l2=h/2; 
% Al igual que el caso anterior, inicializo la variable para 
% aumentar la velocidad de procesamiento
l6=h/6; 

for i=1:n
% Calculo los incrementos de X.
x(i+1)=x(i)+h; 
% Metodo de Runge-Kutta de orden 4
k1=f(x(i),y(i,:),k,m)';
k2=f(x(i)+l2,y(i,:)+l2*k1,k,m)';
k3=f(x(i)+l2,y(i,:)+l2*k2,k,m)';
k4=f(x(i)+h,y(i,:)+h*k3,k,m)';
y(i+1,:)=y(i,:)+l6*(k1+2*k2+2*k3+k4); 
end