clear
clc
a=0;
b=1;
n=10;
y0=1;
f=@(x,y)(x-y);
[x1,y1]=eulersis(f,a,b,y0,n);
[x2,y2]=heunsis(f,a,b,y0,n);
[x3,y3]=cauchysis(f,a,b,y0,n);
[x4,y4]=RK4(f,a,b,y0,n);
hold on
plot(x1,y1,'y.-');
plot(x2,y2,'g.-');
plot(x3,y3,'r.-');
plot(x4,y4,'b.-');

q=(0:0.001:1);
p=dsolve('Dy=t-y','y(0)=1');
p=inline(p);
p=p(q);
plot(q,p,'k-');

legend('Euler','Heun','Cauchy','Runge-Kutta O.4','Original');

%M=[y1,y2,y3,y4];

%Puede observarse como el Método de Heun y el Método de Cauchy convergen a
%los mismos puntos si descomentamos la matriz M y le damos echo en Matlab,
%de echo en la Gráfica no se llega a apreciar la diferencia entre ambas.
%En la matriz M, la segunda y la tercera columna son los valores que 
%adquieren en cada uno de los puntos de X, se ve que son exactamente 
%iguales, cuando el código está totalmente bien definido. 
%La respuesta reside en que hemos cogido pocas cifras significativas. 
%Si tomamos más cifras en un formar long, o colocamos otro ejemplo se 
%observa que los valores difieren, poco, pero difieren. Recordemos que 
%tienen el mismo orden de convergencia (orden 2), por lo que estos valores 
%no deben diferir más Ch^2. 

%Si se hace echo a la función p, se demuestra cono la solución original es
%la que se nos da.