syms x;
V = (3 - 2*x)^2 * x;

% 对V关于x求导
dV_dx = diff(V, x);

% 解方程 dV_dx = 0
x_solution = solve(dV_dx == 0, x);

% 检查解的合法性，确保在0到1.5之间
valid_solutions = x_solution(x_solution >= 0 & x_solution <= 1.5);

% 计算最大容积和对应的边长
max_volume = double(subs(V, x, valid_solutions));
optimal_side_length = double(valid_solutions);

disp('最大容积：');
disp(max_volume);
disp('对应的正方形边长：');
disp(optimal_side_length);
