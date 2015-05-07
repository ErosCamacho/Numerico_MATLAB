function [x,niter,normares]=relajacion(A,b,x0,omega,toler,maxitera)
%%%%%%%%%%%%%%%%%%%%%%%%
% METODO DE RELAJACION %
%%%%%%%%%%%%%%%%%%%%%%%%
% ---- DATOS ---------
% --------------------
% A -> Matriz del sistema
% b -> Vector de términos independientes
% x0 -> Vector inicial
% omega -> parametro de relajacion
% toler -> Tolerancia de parada
% maxitera -> Numero maximo de iteraciones
%%%%%%%%%%%%%%%%%%%%%%%%
% ---- RESULTADO -----
% --------------------
% x -> Matriz del sistema
% niter -> Vector de términos independientes
% normares -> Vector inicial
%%%%%%%%%%%%%%%%%%%%%%%%
format long
x=x0;
n=length(b);
normares=-9999;
if omega<0 || omega>2
    fprintf('El parametro de relajacion introducido no es valido \n');

else
    
    for niter=1:maxitera
        for k=1:n 
            sumatorio=0;
            for j=1:n
            if j~=k
            sumatorio=sumatorio+A(k,j)*x(j);
            end 
            end
    x(k)=((1-omega)*x(k)) + ((omega*(b(k)-sumatorio))/A(k,k));
        end    
   
        if norm((x-x0),inf)<toler
        normares=norm((b-A*x),inf);
        return 
        else 
            
        x0=x;
        
        end     
    end    
end