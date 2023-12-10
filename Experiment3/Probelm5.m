clear;
x = 1:0.1:1.9;
y = [3.56, 3.40, 3.26, 3.14, 3.06, 3.01, 3.00, 3.03, 3.10, 3.20];

% 第一问
value = interp1(x, y, 1.55, 'spline');
disp(value);

fh = @(a,x) a(1)+a(2).*sin(x)+a(3).*cos(x).*cos(x);

a = lsqcurvefit(fh, rand(1,3), x, y);
disp("y的表达式为：");
disp("y 的表达式为：y = " + num2str(a(1)) + " + " + num2str(a(2)) + " * sin(x) + " + num2str(a(3)) + " * cos(x)^2");

y_fit = fh(a, x);

% 第二问
plot(x, y, 'Ro', 'MarkerSize', 10, 'MarkerEdgeColor','k');
hold on;
plot(x, y_fit, 'B-');
hold off;
