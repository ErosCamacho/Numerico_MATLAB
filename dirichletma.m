% Resuelve el problema de contorno
% a(x)u’’+b(x)u’+c(x)u=f(x) x en (0,1),
% u(0)=alfa, u(1)=beta
%--------------------------------------------------------------
% Datos
% -----
% * fa,fb,fc,ff = funciones que definen a los coeficientes a(x),b(x),
% c(x) y al segundo miembro f(x)
% * alfa, beta = condiciones de contorno Dirichlet
% * n = número de puntos interiores del mallado.
% Resultado
% ---------
% * x = discretización de [0,1] (incluidos los extremos)
% * u = vector solución en todos los nodos de x
%---------------------------------------------------------------
% Usa el método de diferencias finitas centradas para la ecuación
%---------------------------------------------------------------
function [x, U]=dirichlet(fa, fb, fc, ff, alfa, beta, n)
h=1/(n+1);%definimos el paso de discretización
xint=[h:h:1-h];%definimos el vector de puntos 'interno'
x=[0 xint 1];%y despues le añadimos los extremos par tener n+2 puntos totales
%y (n+2)-1 subintervalos
for j=1:n%definimos ahora 
    p(j)=2*fa(xint(j))-fc(xint(j))*h^2;% de aqui tenemos p
    q(j)=-fa(xint(j))-0.5*fb(xint(j))*h;% de aqui tenemos q
    r(j)=-fa(xint(j))+0.5*fb(xint(j))*h;% de aqui tenemos r
end
fprintf('Parte MIGUEL ANGEL');
p'
q'
r'
for i=1:n%ff es solo el sumando de las f
    f(i)=ff(xint(i));
end

v=zeros(n,1);%no se traspone despues
v(1)=alfa*r(1);
v(n)=beta*q(n);
b=-h^2*f'-v;
%u=tridiagonal(p, q(1:n-1), r(2:n), b);

%trozo de tridiagonal
%n=length(b);
%x=zeros(1,n);
% Añado a R un primer elemento ficticio
% para que cuadren los índices
%r=[0,r]; no se pone esto porque vamos a usar r(2:n)
% Copio la diagonal P en W
w=p;
% Triangularizo la matriz
for k=2:n
   t=r(k)/w(k-1);
   w(k)=w(k)-t*q(k-1);
   b(k)=b(k)-t*b(k-1);
end
% Resuelvo por remontada
u(n)=b(n)/w(n);
for k=n-1:-1:1
   u(k)=(b(k)-q(k)*u(k+1))/w(k);
end
x=[0 xint 1];
U=[alfa u beta];