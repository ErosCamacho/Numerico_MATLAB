%% M�TODO DE EULER
%---------------------------------------------------------
function [x,y]=eulersis(f,a,b,y0,n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Aproxima la soluci�n de un PVI para un sistema de EDOs
% usando el m�todo de Euler
% Y�=F(x,Y) x en [a,b]; Y(a)=Y0
%% Datos
% -----
% * f = funci�n vectorial del sistema escrita como vector columna.
% para que siga la misma nomenclatura que los ode**
% * a = punto inicial
% * b = punto final
% * y0 = vector columna valor de la soluci�n en x=a
% para que siga la misma nomenclatura que los ode**
% * n = n�mero de pasos para llegar a b
%% Resultado
% ---------
% * x = vector columna con los puntos donde se calcula la soluci�n
% * y = matriz de valores aproximado del vector soluci�n
% en los puntos x.
% Cada columna tiene las aproximaciones que va tomando la funci�n Y, en 
% cada punto que se encuentra en la variable X.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
h=(b-a)/n; %Se inicializa la variable h que van a ser los incrementos de 
           %distancia en la variable X.
m=length(y0);%Como son Y0 es un sistema matricial, necesitamos su longitud 
             %para as� inicializar la variable y como una matriz llena de 0.
x=zeros(n+1,1); %Se inicializa el vector columna X.
y=zeros(n+1,m); %Se inicializa la matriz Y.
y(1,:)=y0'; %Se coloca en la matriz la condici�n inicial de Y.
x(1)=a;%Se coloca el punto inicial en el vector X.
for i=1:n
y(i+1,:)=y(i,:)+h*f(x(i),y(i,:))'; %Este es el M�todo de Euler.
x(i+1)=x(i)+h; %En cada paso del bucle se va rellenando el vector X con los
               %incrementos de h.
end