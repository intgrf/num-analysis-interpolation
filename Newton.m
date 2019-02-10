function g = Newton(x0, h, f)

n = length(f);
x = x0 : h : x0 + (n - 1)*h;
y = f;
g = zeros(1, n);

% конечные разности
d = zeros(1, n);

for j = 2 : n
    for i = j : n
        d(i) = f(i) - f(i-1);
    end
    f(1, j : n) = d(1, j : n);
end



A = 1;
tmp = zeros(1, n);
tmp(n) = f(1);
g = g + tmp;

for i = 1 : n - 1
    A = conv(A, [1, - x(i)]);
    tmp = [zeros(1, length(tmp) - length(A)), A];
    coef = f(i + 1) / (factorial(i) * h^(i));
    g = g + coef * tmp;
end

points = -5 : 0.1 : 6;
values = polyval(g, points);
plot(points, values, 'b', x, y, 'r*'); grid


end