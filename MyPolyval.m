function values = MyPolyval(polynom, points)
deg = length(polynom) - 1;
numberOfPoints = length(points);

values = zeros(1, numberOfPoints);

for i = 1 : numberOfPoints
    for j = 0 : deg
        values(i) = values(i) + polynom(j+1) * points(i)^(deg - j);  
    end
end

end
