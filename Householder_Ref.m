function [Q,R] = Householder_Ref(A)
n = size(A,1);
Q = zeros(n);
R = A;

for i = 1:n
    x = A(i:n,i);
    sgn = sign(x(1,1));
    e1 = zeros(n-i+1,1);
    e1(1,1) = 1;
    u = sgn*norm(x)*e1 + x;
    if norm(u) ~= 0
        u = u/norm(u);
    end
    I = eye(n-i+1);
    F = I - 2*(u*u');
    A(i:n,i:n) = F*A(i:n,i:n);
    Qi = zeros(n);
    if i>1
        Qi(1:i-1,1:i-1) = eye(i-1,i-1);
    end
    Qi(i:n,i:n) = F;
    if i == 1
        Q = Qi;
    else
        Q = Q*Qi;
    end
    R = Qi*R;
end
end

