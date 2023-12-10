clear;
t = [1, 3, 5, 6, 8, 10, 12, 13, 15, 16, 18, 19, 20, 22, 23, 25, 26, 27, 29, 30]; 
R = [32, 34, 31, 35, 34.5, 36, 37, 34, 32, 36, 37, 38, 36, 37, 33, 35, 36, 32, 37, 35]; 

% 8 次多项式拟合
p = polyfit(t, R, 8);

% 在原始数据的范围内计算拟合值
t_fine = linspace(min(t), max(t), 1000);  % 生成更细致的 t 值
R_fit = polyval(p, t_fine);

% 找出拟合曲线的最大值和最小值及其序号
[max_val, max_idx] = max(R_fit);
[min_val, min_idx] = min(R_fit);

% 最大值和最小值对应的 t 值
max_t = t_fine(max_idx);
min_t = t_fine(min_idx);

% 显示结果
disp(['最大值: ', num2str(max_val), ', 在第', num2str(fix(max_t)), '天']);
disp(['最小值: ', num2str(min_val), ', 在第', num2str(fix(min_t)), '天']);

% 绘制原始数据和拟合曲线
plot(t, R, 'o');  % 原始数据
hold on;
plot(t_fine, R_fit, '-');  % 拟合曲线
plot(max_t, max_val, 'r*', min_t, min_val, 'b*');  % 标记最大值和最小值
hold off;
legend('原始数据', '拟合曲线', '最大值', '最小值');
xlabel('t');
ylabel('R');
title('8 次多项式拟合');
