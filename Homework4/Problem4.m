x = [0, 0.3, 0.8, 1.1, 1.6, 2.3];
y = [0.82, 0.72, 0.63, 0.60, 0.55, 0.50];

fh = @(c,x) c(1) + c(2) * exp(-x);
a = lsqcurvefit(fh, rand(1, 2), x, y);
x0 = 0:0.1:2.5;
y0 = fh(a, x0);
plot(x, y, 'ro-', x0, y0, 'b.-','LineWidth', 2);
legend('拟合前', '拟合后');
title('衰减函数拟合曲线');
grid on;
disp(['衰减曲线的表达式为 y = ' num2str(a(1)) ' + ' num2str(a(2)) ' * exp(-x)']);
