function []=circulo(radio,posx,posy,color)
y_c=radio*cos([0:10:360]*pi/180)+posy;
x_c=radio*sin([0:10:360]*pi/180)+posx;
plot(x_c,y_c);
fill(x_c,y_c,color);
axis([-15 15 -15 15]);
axis('square');
end