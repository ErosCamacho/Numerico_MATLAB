%% ENFERMEDAD CON ELIMINACION DE LA POBLACION

format long

% Defino la funcion f, que corresponde al termino independiente 
% de la EDO.
f2=@(t,z,k1,k2,m,x0)(k2*(m-z-x0*exp(-(k1/k2).*z)));

% Inicializo algunos parametros dados.
k1=2*10^(-6);
k2=10^(-4);
m=1*10^5;
z0=0;
y0=1000;
x0=m-y0-z0;

% Represento la solucion utilizando metodos numericos.
% Al igual que en el caso anterior, ha sido necesaria una
% modificacion del Metodo de Heun ya que tuve que introducir 
% una funcion de 6 variables.

% Introduzco los limites de contorno y el numero de iteraciones.
a=0;
b=30;
n=50;

% Llamo a la funcion del metodo de heun
[t,z]=heunsis_to(f2,a,b,z0,n,k1,k2,m,x0);

% Represento el resultado obtenido.
figure(1);
hold on
plot(t,z,'b');

% Pongo etiquetas a la grafica.
title('Poblacion eliminada frente al tiempo')
xlabel('Tiempo(dias)');
ylabel('Poblacion eliminada');
legend('Poblacion eliminada');

% Puesto que el valor de z que se obtiene es bastante inferior,
% no tiene sentido representar sanos, infectados y poblacion 
% eliminada en una misma grafica, por lo que solo vamos a 
% representar sanos e infectados frente a tiempo.

% Represento los datos
figure(2);
hold on
x=x0*exp(-(k1/k2)*z);
plot(t,x,'g');
y=m-x-z;
plot(t,y,'r');

% La poblacion en este caso que sobrevive es la de contagiados
% mas la de sanos.
m2=y+x;
plot(t,m2,'m');

% Pongo etiquetas a la grafica.
title('Poblacion infectada/sana frente al tiempo')
legend('Sanos', 'Infectados','Poblacion');
xlabel('Tiempo(dias)');
ylabel('Poblacion');