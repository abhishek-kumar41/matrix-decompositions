function x = back_substitution(U,y)
n = size(U,1);
x = zeros(n,1);
for i = n:-1:1
    if abs(U(i,i)) > 1.0e-10
        sum = 0;
        for j = i+1:n
            sum = sum + U(i,j)*x(j,1);
        end
        x(i,1) = (y(i,1) - sum)/U(i,i);
    end
end
end

