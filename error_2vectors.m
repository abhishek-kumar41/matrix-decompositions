function [error] = error_2vectors(x,y)
n = size(x);
sum = 0;
for i = 1:n
    sum = sum + (x(i,1) - y(i,1))^2;
end
error = sqrt(sum);
end

