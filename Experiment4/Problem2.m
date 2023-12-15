m = 0.2;
k = 0.2;
c = 0.1;
f = @(t, x) [x(2); (1/m) * (-c * x(2) - k * x(1) - 0.1 * exp(-0.2 * t)); x(1) - 1];
[t, x] = ode45(f, [0, 30], [1, -2, 0]);

% 创建一个带有多个子图的单一图形
figure;

subplot(3, 2, 1);
plot(t, x(:, 1), '--r', 'LineWidth', 2);
hold on;
scatter(t, x(:, 1), '*');
title('位置');
xlabel('t');
ylabel('x_1(t)');
legend('ODE解', '数据点');

subplot(3, 2, 2);
plot(t, x(:, 2), '--r', 'LineWidth', 2);
hold on;
scatter(t, x(:, 2), '*');
title('速度');
xlabel('t');
ylabel('x_2(t)');
legend('ODE解', '数据点');

subplot(3, 2, 3);
plot(t, x(:, 3), '--r', 'LineWidth', 2);
hold on;
scatter(t, x(:, 3), '*');
title('加速度');
xlabel('t');
ylabel('x_3(t)');
legend('ODE解', '数据点');

subplot(3, 2, 4);
plot(t, m * power(x(:, 2), 2) / 2, '--r', 'LineWidth', 2);
hold on;
scatter(t, m * power(x(:, 2), 2) / 2, '*');  % 修改这里的scatter参数
title('弹簧振子的动能');
xlabel('t');
ylabel('动能');
legend('ODE解', '数据点');

subplot(3, 2, 5);
plot(t, k * power(x(:, 1), 2) / 2, '--r', 'LineWidth', 2);
hold on;
scatter(t, k * power(x(:, 1), 2) / 2, '*');  % 修改这里的scatter参数
title('弹簧振子势能');
xlabel('t');
ylabel('势能');
legend('ODE解', '数据点');

subplot(3, 2, 6);
plot(t, (k * power(x(:, 1), 2) / 2) + (m * power(x(:, 2), 2) / 2), '--r', 'LineWidth', 2);
hold on;
scatter(t, (k * power(x(:, 1), 2) / 2) + (m * power(x(:, 2), 2) / 2), '*');  % 修改这里的scatter参数
title('弹簧振子能量');
xlabel('t');
ylabel('能量');
legend('ODE解', '数据点');
