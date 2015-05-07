clear
clc
format short
%APARTADO A
b=zeros(19,1);
for k=1:19
b(k)=-0.25*sin(pi*k*0.05);
end

v=zeros(19,1);
for i=1:19
   v(i)=2;
end
A=diag(v)-diag(ones(18,1),1)-diag(ones(18,1),-1);

%APARTADO B
spy(A);

%APARTADO C
condeu=cond(A);
fprintf('Condicion de norma euclídea: %f',condeu);

%APARTADO D
I=eye(19);
D=diag(v);
J=I-(inv(D)*A);
J

%APARTADO E
%El radio espectral de la matriz J coincide con su norma euclidea, debido a
%que la matriz es simetrica. En otro caso tendría que calcular sus
%autovalores y ver cual es el mayor de ellos en modulo
format long
radioesp=norm(J);
fprintf('El radio espectral es: %17.15f \n \n',radioesp);


%APARTADO F
omegaopt=2*(1/(1+sqrt(1-(radioesp^2))));
fprintf('El omega optimo es: %18.16f \n \n',omegaopt);

maxitera=100000;
toler=0.0001;
x0=zeros(19,1);

radioespJ=norm(J);
fprintf('Radio espectral del método de Jacobi: %17.15f \n',radioespJ);
radioespG=radioespJ^2;
fprintf('Radio espectral del método de Gauss-Seidel: %17.15f \n',radioespG);
radioespGw=omegaopt-1;
fprintf('Radio espectral del método de relajación: %17.15f \n',radioespGw);

%El método de Jacobi tardará en converger ya que el valor del radio
%espectral de J es muy próximo a 1. Analizando cada radio espectral se ve
%como el menor radio espectral es el del método de relajación con ese omega
%óptico, por lo que será el primero en converger.

%APARTADO G
format short
maxitera=100000;
toler=0.0001;
x0=zeros(19,1);
omega=[0.6,1,1.2,1.6,1.7,1.71,1.72,1.75,1.8];
numeroiter=zeros(9,1);
for m=1:9
   [x,niter,normares]=relajacion(A,b,x0,omega(m),toler,maxitera); 
   numeroiter(m)=niter;
end
format bank
M=[omega',numeroiter];
M


%APARTADO H
[x,niteropt,normares]=relajacion(A,b,x0,omegaopt,toler,maxitera);
fprintf('Iteraciones del método de relajación: %5.0f \n',niteropt);
%No se obtiene el minimo valor de iteraciones, esto es debido a los
%redondeos que MATLAB internamente realiza que aproxima el verdadero valor
%de ese omega optimo.

%APARTADO I
figure 
%Voy a ordenar los valores
omega=[0.6,1,1.2,1.6,1.7,1.71,1.72,omegaopt,1.75,1.8];
vector=numeroiter;
for i=8:10
    if i==8 
    vector(i)=niteropt;
    else
    vector(i)=numeroiter(i-1);
    end
end
numeroiter=vector;
%Representación de los puntos. Se aprecia perfectamente la tendencia que
%siguen teniendo un minimo de iteraciones aproximadamente en el vértice de
%la gráfica.
plot(omega,numeroiter,'r');

