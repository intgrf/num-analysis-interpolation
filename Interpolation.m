clc
clear

x = [ -1, 5, 8, 10];
y = [-10, 4, 6, 3];
f = [-3, 2, 5, 2];
g = Lagrange(x, y);

xCoord = -5 : 0.1 : 15;
yCoord = polyval(g, xCoord);

q = Newton(2, 1, f);


plot(xCoord, yCoord, 'r', x, y, 'b*'); grid
