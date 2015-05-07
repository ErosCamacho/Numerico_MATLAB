g=9.8;
v0=50;
syms x
f='v0-g*x';
p=inline(f)
puntos=0:0.001:100;
puntosx=p(g,v0,puntos);
f='v0*x-0.5*g*x';
p=inline(f);
puntosy=p(g,v0,puntos);

for i=1:10000
vector(i)=puntosx(i);
vector(i+10000)=puntosy(i);
end

