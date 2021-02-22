function [error] = error_2matrices(A,B)
n = size(A,1);
sum = 0;
for i = 1:n
    for j = 1:n
        sum = sum + (A(i,j) - B(i,j))^2;
    end
end
error = sqrt(sum);
end

