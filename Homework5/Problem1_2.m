clear;
syms x1 x2 x3  % 定义符号变量
f = [2*x1 + 9*x2 - 13, 3*x1 + 4*x2 + 11*x3 - 6, 2*x1 + 2*x2 + 6*x3 - 6];  % 方程组
solutions = solve(f, [x1, x2, x3]);  % 求解方程组
x1Sol = double(solutions.x1);  % 提取 x1 的解并转换为小数
x2Sol = double(solutions.x2);  % 提取 x2 的解并转换为小数
x3Sol = double(solutions.x3);  % 提取 x3 的解并转换为小数
disp("solve函数求解线性方程组：")
disp([x1Sol, x2Sol, x3Sol]');  % 显示解
