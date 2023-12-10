clear;
A = [10,-1,0; -1,10,-2; 0,-2,10];
B = [9,7,6]';
tic;
[x,n]=jacobi(A,B,[0,0,0]',1.0e-8);
toc;
disp("Jacobi方法求解：")
disp(x);
disp("Jacobi收敛过程：")
disp(n);
