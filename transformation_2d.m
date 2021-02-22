function [Q,R] = transformation_2d(A)
n = size(A,1);

Q = eye(n);

for j = 1:n-1
    for i = n:-1:j+1
        if A(i,j)~=0
            G = eye(n);
            a = A(j,j);
            b = A(i,j);
            c = sqrt(a^2 + b^2);
            cos_theta = a/c;
            sin_theta = b/c;
            G(i,i) = cos_theta;
            G(j,j) = cos_theta;
            G(i,j) = -sin_theta;
            G(j,i) = sin_theta;
            A = G*A;
            Q = Q*G';
        end
    end
end
R = A;

end