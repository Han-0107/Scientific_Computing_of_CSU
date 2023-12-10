fh = @(a,t) a(1)*exp(a(2)*t);

R = [50, 61, 70, 72, 80, 83, 91, 93];
t = [10, 21, 26, 30, 35, 41, 43, 45];

% 使用两个参数的初始估计值
initialGuess = [1, 0.01];

% 使用 lsqcurvefit 进行拟合
a = lsqcurvefit(fh, initialGuess, t, R);

% 计算模型预测值
R_fit = fh(a, t);

% 绘制原始数据
plot(t, R, 'Ro', 'MarkerSize', 10, 'MarkerEdgeColor','k');
hold on; 

% 绘制拟合曲线
plot(t, R_fit, 'b-');

% 添加图例和标题
legend('原始数据', '拟合曲线');
xlabel('t');
ylabel('R');
title(['表达式为：R=', num2str(a(1)), '*exp(', num2str(a(2)), '*t)']);
hold off; 


