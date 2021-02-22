function [L,U] = LU_decomp(A)
U = zeros(n);
L = eye(n);
for i = 1:n
    U(i,i) = A(i,i);
    U(i,i+1:n) = A(i,i+1:n);
    L(i+1:n,i) = A(i+1:n,i)/A(i,i);
    A(i+1:n,i+1:n) = A(i+1:n,i+1:n) - L(i+1:n,i)*U(i,i+1:n);
end

end

