function y = forward_substitution(L,b)
n = size(L,1);
y = zeros(n,1);
for i = 1:n
    if abs(L(i,i)) > 1.0e-10
        sum = 0;
        for j = 1:i-1
            sum = sum + L(i,j)*y(j,1);
        end
        y(i,1) = (b(i,1) - sum)/L(i,i);
    end
end
end

