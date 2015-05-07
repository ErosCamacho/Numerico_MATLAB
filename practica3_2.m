clear
clc
format long
%He colocado el format long para que se vea la importancia de los
%redondeos, aunque es totalmente innecesario.
A=[5,-2,1,0;1,4,0,-2;0,5,8,1;1,-1,-2,5];
b=[19;1;10;-5];
maxitera=100000;
toler=0.00000001;
x0=[3;4;5;6];

%Con los valores iniciales que he colocado, G-S converge más rapidamente
%que el resto. El que peor converge es el sobrerelajado ya que a omega=1.5
%ni converge y con un valor con el que converge, omega=1.37, lo hace en 787
%iteraciones. 

for i=1:3
   if i==1  
   omega=0.5;
   fprintf('SUBRELAJACION \n');
   elseif i==2
   omega=1;
   fprintf('GAUSS-SEIDEL \n');
   elseif i==3
   omega=1.37;
   fprintf('SOBRELAJACION \n');
   end 
   
[x,niter,normares]=relajacion(A,b,x0,omega,toler,maxitera);
   

fprintf('Vector Solucion \n');
disp(x);
fprintf('Numero de Iteraciones: ');
disp(niter);
fprintf('Norma Infinito del Residuo: ');
disp(normares);
end 