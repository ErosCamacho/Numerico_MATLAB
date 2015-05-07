clear
clc
%Inicializo las funciones
fa=@(x)(1);
fb=@(x)(exp(x));
fc=@(x)(pi^2);
ff=@(x)(-pi*exp(x)*sin(pi*x));

%Creo las condiciones Dirichlet
alfa=1;
beta=-1;

%Represento el coseno.
hold on
xx=(0:0.01:1);
yy=cos(pi*xx);
plot(xx,yy,'-k');

%Para cada n, llamo a la funcion dirichlet y represento

%Se podrian ir machacando las variables x, u a la hora de representar pero
%como no conocemos la finalidad del programa es mejor utilizar variables
%diferentes.

n=10;
[x1,u1]=dirichlet(fa,fb,fc,ff,alfa,beta,n);
plot(x1,u1,'.r');

n=20;
[x2,u2]=dirichlet(fa,fb,fc,ff,alfa,beta,n);
plot(x2,u2,'.g');

n=50;
[x3,u3]=dirichlet(fa,fb,fc,ff,alfa,beta,n);
plot(x3,u3,'.y');

%Creo la leyenda del plot
legend('cos(pi*x)','n=10','n=20','n=50');