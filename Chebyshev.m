clc
clear

% Нахождение полинома Чебышёва
coef = [2, 0];
T0 = 1;
T1 = [1, 0];
Tn = [];
n = 11;
for i = 2 : n
    first = conv(coef, T1);
    second = [zeros(1, length(first) - length(T0)), T0];
    Tn = first - second;
    T0 = T1;
    T1 = Tn;
end

Tn = Tn /( 2^(n-1));
val = -1.5 : 0.01 : 1.5;
chebysh = polyval(Tn, val); 

plot(val, chebysh, 'r'); grid


% Нахождение корней полинома Чебышёва
roots_practice = roots(Tn);
roots_theory = zeros(1, n);

for k = 1 : n
    roots_theory(k) = cos((2*k - 1)* pi / (2 * n));
end

roots_practice = sort(roots_practice);
roots_theory = sort(roots_theory);

% Перетягивание на отрезок [a, b]
roots_practice = roots_practice';
a = 1;
b = n;
roots_result = zeros(1, n);
for k = 1 : n
    roots_result(k) = 0.5 * ((b - a) * roots_practice(k) + a + b);
end

% Интерполяция
% по корням полинома Чебышёва
y = sin(roots_result);
cheb = polyfit(roots_result, y, n-1);
x = 1 : 0.01 : n;
y_cheb = polyval(cheb, x);
% по равноотстоящим узлам
x_eq = 1 : n;
y_eq_sin = sin(x_eq);
eq = polyfit(x_eq, y_eq_sin, n-1);
y_eq = polyval(eq, x);
y_sin = sin(x);

%plot(x, y_cheb, 'r', x, y_eq, 'b', x, y_sin, 'g'); grid

% Найдем максимальное отклонение от sin 
max_cheb = 0;
max_eq = 0;
dif_cheb = abs(y_sin - y_cheb);
dif_eq = abs(y_sin - y_eq);
len = length(dif_cheb);
max_y_cheb = y_cheb(1);
max_x_cheb = x(1);
max_y_eq = y_eq(1);
max_x_eq = x(1);
for i = 1 : len
    if dif_cheb(i) > max_cheb
        max_cheb = dif_cheb(i);
        max_y_cheb = y_cheb(i);
        max_x_cheb = x(i);
    end
    if dif_eq(i) > max_eq
        max_eq = dif_eq(i);
        max_y_eq = y_eq(i);
        max_x_eq = x(i);
    end
end
max_cheb
max_eq

%plot(x, y_cheb, 'r', max_x_cheb, max_y_cheb, 'r*', x, y_eq, 'b', max_x_eq, max_y_eq, 'b*', x, y_sin, 'g'); grid

