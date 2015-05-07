clear
clc

%APARTADO A
p=dsolve('Dy=t-y','y(0)=1'); %Toma t como variable independiente

%APARTADO B
a=0;
b=1;
y0=1;
f='x-y';
n=[8,16,32,64,128];
color=['b*_','g._','ro_','cx_','m+_'];

hold on
figure(1)
[x8,y8]=euler15(f,a,b,y0,n(1));
plot(x8,y8,'y.-');
[x16,y16]=euler15(f,a,b,y0,n(2));
plot(x16,y16,'c.-');
[x32,y32]=euler15(f,a,b,y0,n(3));
plot(x32,y32,'g.-');
[x64,y64]=euler15(f,a,b,y0,n(4));
plot(x64,y64,'b.-');
[x128,y128]=euler15(f,a,b,y0,n(5));
plot(x128,y128,'r.-');


%APARTADO C

q=(0:0.001:1);
p=inline(p);
p=p(q);
plot(q,p,'k-');

legend('n=8','n=16','n=32','n=64','n=128','Original');