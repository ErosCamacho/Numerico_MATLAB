%% RESOLUCION PROBLEMAS DE CONTORNO TIPO DIRICHLET [0,1]
%---------------------------------------------------------------------
%   [x,u]=dirichlet(fa,fb,fc,ff,alfa,beta,n)
%---------------------------------------------------------------------
%   a(x)u''+b(x)u'+c(x)u=f(x) con x en (0,1)
%   u(0)=alfa,  u(1)=beta
%---------------------------------------------------------------------
%   Datos
%   -----
%   * fa,fb,fc,ff = funciones que definen a los coeficientes a(x), b(x),
%                  c(x) y al segundo miembro f(x) 
%   * alfa,beta   = condiciones de contorno Dirichlet
%   * n           = numero de puntos interiores del mallado.
%
%   Resultado
%   ---------
%   * x           = discretizacion de [0,1] (incluidos los extremos)
%   * u           = vector solucion en todos los nodos de x
%--------------------------------------------------------------------
%   Usa el metodo de diferencias finitas centradas para la ecuacion
%--------------------------------------------------------------------

function [x,u]=dirichlet(fa,fb,fc,ff,alfa,beta,n)

%Inicializo las variables que voy a utilizar.
r=zeros(n,1);
p=zeros(n,1);
q=zeros(n,1);
f=zeros(n,1);

%Creo la variable de paso h, y la posicion de las x que voy a utilizar
h=1/(n+1);
xint=(h:h:1-h);

%Obtengo cada una de las variables que conformaran mi matriz del problema,
%junto con su termino independiente.
for j=1:n
   %Evaluo las funciones a(x),b(x),c(x) y f(x) en cada uno de los puntos
   %interiores de xint.
   aj=fa(xint(j));
   bj=fb(xint(j));
   cj=fc(xint(j));
   
   %Obtengo las componentes p,q,r de la matriz que están descritas por el
   %método
   p(j)=2*aj-((h^2)*cj);
   r(j)=-aj+(h*bj*0.5);
   q(j)=-aj-(h*bj*0.5);
  
   %Además obtengo f(x) evaluado sobre cada punto de xint
   f(j)=ff(xint(j));
end

%Creo el término independiente descrito por el método
B=-h^2*f;
B(1)=-alfa*r(1)+B(1);
B(n)=-beta*q(n)+B(n);

%Puesto que en la matriz los vectores diagonal superior y diagonal inferior
%son del orden (n-1) tenemos que eliminar en cada caso el término
%correspondiente.
q=q(1:n-1);
r=r(2:n);

%Llamo a la función tridiagonal para que me resuelva el problema.
u=tridiagonal(p,q,r',B);

%Incluyo la condicion Dirichlet en los vectores solucion.
x=[0,xint,1];
u=[alfa,u,beta];


return