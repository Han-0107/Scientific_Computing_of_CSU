clc;

A = [2,9,0; 3,4,11; 2,2,6];
B = [13,6,6]';
L = chol(A, 'lower');
x = L \ (L' \ B);

disp('Cholesky分解法求解线性方程组:');
disp('解向量 x:');
disp(x);

% 矩阵不是对称正定的，因此Cholesky分解方法并不使用于这个问题！
