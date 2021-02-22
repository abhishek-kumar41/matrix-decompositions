clc
clear all
format long

A = [1 -3 5 2; 1 0 1 -1; 6 1 -9 2; 1 0 -6 3];

n = size(A,1);
P = eye(n);
permutation_count = 0;
for j = 1:n
    row_number = j;
    pivot = abs(A(j,j));
    for i = j:n
        if pivot < abs(A(i,j))
            pivot = abs(A(i,j));
            row_number = i;
        end
    end
    if row_number ~= j
        temp1 = A(j,:);
        A(j,:) = A(row_number,:);
        A(row_number,:) = temp1;
        temp2 = P(j,:);
        P(j,:) = P(row_number,:);
        P(row_number,:) = temp2;
        permutation_count = permutation_count + 1;
    end
end

U = zeros(n);
L = eye(n);
lu_check = 0;
for i = 1:n
    if A(i,i) == 0
        lu_check = -1;
        break;
    end
    U(i,i) = A(i,i);
    U(i,i+1:n) = A(i,i+1:n);
    L(i+1:n,i) = A(i+1:n,i)/A(i,i);
    A(i+1:n,i+1:n) = A(i+1:n,i+1:n) - L(i+1:n,i)*U(i,i+1:n);
end
if lu_check == -1
    disp('LU decomposition doesnot exist.')
else
    disp('L =')
    disp(L)
    disp('U =')
    disp(U)
end

%Computation of Determinant of A using P, L and U
determinant = (-1)^permutation_count;
for i = 1:n
    determinant = determinant*L(i,i)*U(i,i);
end
fprintf('Determinat of the matrix using P, L and U is:\n%f\n\n',determinant);

%Computation of Inverse of A using P, L and U
inverse_L = zeros(n);
inverse_U = zeros(n);
I = eye(n);
for i = 1:n
    y = forward_substitution(L, I(:,i));
    inverse_L(:,i) = y;
end

for i = n:-1:1
    x = back_substitution(U, I(:,i));
    inverse_U(:,i) = x;
end

if lu_check == -1
    disp('Inverse doesnot exist.')
else
    disp('Inverse of the matrix using P, L and U is:')
    disp(inverse_U*inverse_L*P')
end

    

