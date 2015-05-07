function [x,y]=euler15(f,a,b,y0,n)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% APROXIMA LA SOLUCIÓN DE UNA PVI PARA UNA EDO %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Usamos el método de Euler donde y'=f(x,y) ;  %
% x está definido entre [a,b]; y(a)=y0         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ----------------- DATOS -------------------- %
% f -> Funcion de la EDO, entre comillas       %
% a -> Punto inicial                           %
% b -> Punto final                             %
% y0 -> Valor de la funcion en x=a             %
% n -> Numero de pasos hasta b                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --------------- RESULTADOS ----------------- %
% x -> Vector de puntos donde se calcula la    %
%      la solucion                             %
% y -> Vector de valores aproximados de la     %
%      solucion en los puntos x                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h=(b-a)/n; %Calculamos los incrementos de f
g=inline(f); %Como le voy a introducir f con comillas, inucializo g como funcion
y=zeros(n+1,1); %Inicializo la dimension de y,x
y(1)=y0;
x=(a:h:b); %Creo el vector x como los incrementos 
for i=1:n
    y(i+1)=y(i)+h*g(x(i),y(i)); %Metodo de Euler
end