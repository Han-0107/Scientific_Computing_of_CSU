
subplot(2, 1, 1);

mu = 1; 

% 定义 Van der Pol 方程
f = @(t, y) [y(2); -y(1) + y(2) * mu * (1 - y(1)^2)];

% 设置初始条件
initial_condition = [0, 1];

% 求解数值解
[t, y] = ode45(f, [0, 50], initial_condition);

% 绘制数值解
plot(t, y(:, 1));
title('Van der Pol Equation with \mu = 1');
xlabel('t');
ylabel('y(t)');


subplot(2, 1, 2);

mu = 50;


f = @(t, y) [y(2); -y(2) + mu * (1 - y(1)^2)];

initial_condition = [0, 1];

[t, y] = ode45(f, [0, 50], initial_condition);

plot(t, y(:, 1));
title('Van der Pol Equation with \mu = 50');
xlabel('t');
ylabel('y(t)');
