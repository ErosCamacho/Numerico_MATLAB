%% MÉTODO DE RUNGE-KUTTA DE ORDEN 4
%---------------------------------------------------------
function [x,y]=RK4(f,a,b,y0,n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Aproxima la solución de un PVI para un sistema de EDOs
% usando el método de Runge-Kutta de orden 4
% Y’=F(x,Y) x en [a,b]; Y(a)=Y0
%% Datos
% -----
% * f = función vectorial del sistema escrita como vector columna.
% para que siga la misma nomenclatura que los ode**
% * a = punto inicial
% * b = punto final
% * y0 = vector columna valor de la solución en x=a
% para que siga la misma nomenclatura que los ode**
% * n = número de pasos para llegar a b
%% Resultado
% ---------
% * x = vector columna con los puntos donde se calcula la solución
% * y = matriz de valores aproximado del vector solución
% en los puntos x.
% Cada columna tiene las aproximaciones que va tomando la función Y, en 
% cada punto que se encuentra en la variable X.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=(b-a)/n; %Se inicializa la variable h que van a ser los incrementos de 
           %distancia en la variable X.
m=length(y0);%Como son Y0 es un sistema matricial, necesitamos su longitud 
             %para así inicializar la variable y como una matriz llena de 0.
x=zeros(n+1,1); %Se inicializa el vector columna X.
y=zeros(n+1,m); %Se inicializa la matriz Y.
y(1,:)=y0'; %Se coloca en la matriz la condición inicial de Y.
x(1)=a; % Se coloca la condición inicial en el vector X.
l2=h/2; % Creo la variable l, para que en cada iteración no se tenga que 
        % calcular h/2 de nuevo aumentando la velocidad de procesamiento.
l6=h/6; % Al igual que el caso anterior, inicializo la variable para 
       % aumentar la velocidad de procesamiento
for i=1:n
x(i+1)=x(i)+h; %Calculo los incrementos de X.
k1=f(x(i),y(i,:))';
k2=f(x(i)+l2,y(i,:)+l2*k1)';
k3=f(x(i)+l2,y(i,:)+l2*k2)';
k4=f(x(i)+h,y(i,:)+h*k3)';
y(i+1,:)=y(i,:)+l6*(k1+2*k2+2*k3+k4); %Método de Runge-Kutta de orden 4
end