clear;
T = [32, 34, 31, 35, 34.5, 36, 37, 34, 32, 36, 37, 38, 36, 37, 33, 35, 36, 32, 37, 35];
d = [1, 3, 5, 6, 8, 10, 12, 13, 15, 16, 18, 19, 20, 22, 23, 25, 26, 27, 29, 30];

% 多项式拟合
p2 = polyfit(d, T, 2);
p5 = polyfit(d, T, 5);
p10 = polyfit(d, T, 10);
p12 = polyfit(d, T, 12);

T_fit2 = polyval(p2, d);
T_fit5 = polyval(p5, d);
T_fit10 = polyval(p10, d);
T_fit12 = polyval(p12, d);

% 计算拟合值的误差平方和
error2 = sum((T - T_fit2).^2);
error5 = sum((T - T_fit5).^2);
error10 = sum((T - T_fit10).^2);
error12 = sum((T - T_fit12).^2);

% 绘制原始数据和拟合曲线
plot(d, T, 'o'); 
hold on;
plot(d, T_fit2, 'r-'); 
plot(d, T_fit5, 'g-');
plot(d, T_fit10, 'b-'); 
plot(d, T_fit12, 'p-'); 
hold off;
legend('原始数据', '拟合曲线(2次)', '拟合曲线(5次)', '拟合曲线(10次)', '拟合曲线(12次)');
xlabel('t');
ylabel('R');
title('多项式拟合');

% 显示误差平方和
disp(['2次拟合值的误差平方和: ', num2str(error2)]);
disp(['5次拟合值的误差平方和: ', num2str(error5)]);
disp(['10次拟合值的误差平方和: ', num2str(error10)]);
disp(['12次拟合值的误差平方和: ', num2str(error12)]);