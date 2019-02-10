clc
clear
l = 2; 
r = 30;
n = l : r; % массив числа точек
max = zeros(1, r - l + 1); % массив соответсвующих точкам максимумов отклонения

for k = 1 : length(n)
    x0 = 1;
    delta = 1;
    xn = x0 + (n(k)-1)*delta;
    x = x0 : delta : xn;
    f = sin(x);
 
    g = Newton(x0, delta, f);
    
    points = x0 : 0.01 : xn;
    values = polyval(g, points);
    sinvalues = sin(points);
    pointsNum = length(points);
    for i = 1 : pointsNum 
        cur = abs(values(i) - sinvalues(i));
        if (cur > max(k)) 
            max(k) = cur;
        end
    end
end

plot(n, max, 'r*'); grid