fa=inline('1');
fb=inline('exp(x)');
fc=inline('pi^2');
ff=inline('-pi*exp(x)*sin(pi*x)');
a=1; b=-1;
[x, U]=dirichletma(fa, fb, fc, ff,a, b, 10);
plot(x,U);
