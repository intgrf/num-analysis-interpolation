function g = Lagrange(x, y)

n = length(x);
g = zeros(1, n);

for k = 1 : n
    A = 1;
    for j = 1 : n
        if j ~= k
            A = conv(A, [1/(x(k) - x(j)), -x(j)/(x(k) - x(j))]);
        end
    end 
    g = g + y(k) * A;
end