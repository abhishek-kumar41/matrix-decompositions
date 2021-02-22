function [Q,R] = Gram_Schmidt(A)
n = size(A,1);
Q = zeros(n);
R = zeros(n);

r = 0;
for i = 1:n
    sum = 0;
    for j = 1:r
        sum = sum + Q(:,j)*Q(:,j)'*A(:,i);
        R(j,i) = Q(:,j)'*A(:,i);
    end
    a_ = A(:,i) - sum;
    R(i,i) = norm(a_);
    if norm(a_) ~= 0
        r = r + 1;
        Q(:, r) = a_/norm(a_);
    end
end

end

