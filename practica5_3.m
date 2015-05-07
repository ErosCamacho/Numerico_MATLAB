clear
clc
f=@(t,z)([-0.16*z(1)+0.08*z(1)*z(2);-0.9*z(1)*z(2)+4.5*z(2)]);
%Acabo definir la función f que utilizaré más tarde.
int=[0,50]; %Intervalo
inicio=[4,4];% Los puntos de inicio, x1(0)=x2(0)=4
[T,Z]=ode45(f,int,inicio); %Utilizo la función ode45.

figure(1);
plot(T,Z); %Represento en la misma grafica las dos funciones
legend('x1(t)','x2(t)');
%La primera columna de Z son las aproximaciones de x1(t) en los puntos de
%T, mientras que la segunda columna de Z son las aproximaciones de x2(t) en
%los puntos de T.
xlabel('t') %Se representa en el eje de abscisa la variable t. 

figure(2);
plot(Z(:,1),Z(:,2)); %Lo que hemos hecho es dibujar de forma parametrica 
                     %cada solucion, una frente a la otra. En definitiva lo
                     %que se consigue es modelar el espacio de fases.