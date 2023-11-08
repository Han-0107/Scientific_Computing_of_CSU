x1 = -3:0.1:3;
y1 = (x1.*x1)./2;

t = -1:0.1:pi;
x2 = sin(3.*t).*cos(t);
y2 = sin(3.*t).*sin(t);

plot(x1, y1, 'r--', 'LineWidth', 2); % 使用红色双划线样式
hold on;
plot(x2, y2, 'k:', 'Marker', 'o', 'MarkerSize', 1, 'LineWidth', 2); % 使用黑色点画线样式
hold off;
