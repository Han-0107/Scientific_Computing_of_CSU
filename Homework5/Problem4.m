clear;
% 定义微分方程组为匿名函数
ode = @(t, y) [y(2)*y(3); -y(1)*y(3); 0.51*y(1)*y(2)];

% 初始条件
y0 = [0, 1, 1];

% 时间范围
tspan = [0, 20];

% 使用 ode45 求解
[t, y] = ode45(ode, tspan, y0);

% 可视化结果
plot(t, y(:,1), 'b', t, y(:,2), 'r', t, y(:,3), 'g');
legend('y_1', 'y_2', 'y_3');
xlabel('Time');
ylabel('Solution');
title('Solution of Differential Equations using Anonymous Function');
