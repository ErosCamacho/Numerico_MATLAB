function gershcircles(A)
%--------------------------------------------------------
%GERSHCIRCLES dibuja los círculos de Gershgorin
%   GERSHCIRCLES(A) traza los círculos de
%   Gershgorin asociados a la matriz  A y
%   a su traspuesta.
%   Los centros de los círculos se identifican por un aspa.
%--------------------------------------------------------
% A. Quarteroni, F. Saleri
% Politécnico de Milán
% -------------------------------------------------------
clf
n = size(A);
if n(1) ~= n(2)
    error('Solo matrices cuadradas');
else
    n = n(1);
    circler = zeros(n,201);
    circlec = circler;
end
center = diag(A);
radiic = sum(abs(A-diag(center)));
radiir = sum(abs(A'-diag(center)));
one = ones(1,201);
cosisin = exp(i*[0:pi/100:2*pi]);
figure(1);
title('Círculos por filas');
xlabel('Re'); ylabel('Im');
figure(2);
title('Círculos por columnas');
xlabel('Re'); ylabel('Im');
for k = 1:n
   circlec(k,:) = center(k)*one + radiic(k)*cosisin;
   circler(k,:) = center(k)*one + radiir(k)*cosisin;
   figure(1);
   patch(real(circler(k,:)),imag(circler(k,:)),...
   'red');
   hold on
   plot(real(circler(k,:)),imag(circler(k,:)),'k-',...
   real(center(k)),imag(center(k)),'kx');
   figure(2);
   patch(real(circlec(k,:)),imag(circlec(k,:)),...
   'green');
   hold on
   plot(real(circlec(k,:)),imag(circlec(k,:)),'k-',...
   real(center(k)),imag(center(k)),'kx');
end
for k = 1:n
   figure(1);
   plot(real(circler(k,:)),imag(circler(k,:)),'k-',...
   real(center(k)),imag(center(k)),'kx');
   figure(2);
   plot(real(circlec(k,:)),imag(circlec(k,:)),'k-',...
   real(center(k)),imag(center(k)),'kx');
end
figure(1);
axis image;
hold off
grid on
figure(2);
axis image;
hold off
grid on
return