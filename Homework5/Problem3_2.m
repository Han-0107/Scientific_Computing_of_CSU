syms x y  % 定义符号变量
eq1 = cos(x) + y*exp(x) - 2 == 0;  % 第一个方程
eq2 = sin(y) + x*exp(y) - 2 == 0;  % 第二个方程
solutions = solve([eq1, eq2], [x, y]);  % 求解方程组

% 提取解并转换为数值形式
xSol = double(solutions.x);
ySol = double(solutions.y);
disp("使用solve函数求解：")
disp(['Solution: x = ', num2str(xSol), ', y = ', num2str(ySol)]);
