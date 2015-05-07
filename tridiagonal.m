%% RESOLUCIÓN POR ELIMINACIÓN DE UN SISTEMA ALGEBRAICO TRIDIAGONAL
%-----------------------------------------------------------------
% x=tridiagonal(P,Q,R,b) 
% 
%  Datos
%  -----
% * P vector diagonal principal orden n
% * Q vector diagonal superior orden (n-1)
% * R vector diagonal inferior orden (n-1)
% * b vector segundo miembro orden n
%
%  Resultado
%  ---------
% * x solución del sistema lineal  Ax=b (vector fila)
%   con A matriz tridiagonal [R P Q]
%   Usa el método de eliminación de Gauss adaptado a su estructura
%------------------------------------------------------------------
function x=tridiagonal(P,Q,R,b)

n=length(b);
x=zeros(1,n);
% Añado a R un primer elemento ficticio
% para que cuadren los índices
R=[0,R]; 
% Copio la diagonal P en W
W=P;
% Triangularizo la matriz
for k=2:n
   t=R(k)/W(k-1);
   W(k)=W(k)-t*Q(k-1);
   b(k)=b(k)-t*b(k-1);
end
% Resuelvo por remontada
x(n)=b(n)/W(n);
for k=n-1:-1:1
   x(k)=(b(k)-Q(k)*x(k+1))/W(k);
end
return