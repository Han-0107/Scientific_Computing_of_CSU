x = 0:0.2:3;
y1 = zeros(size(x));
y2 = zeros(size(x));
y1 = 2.*exp(-x).*sin(x)-0.3;
y2 = 0.2.*sin(pi.*x+pi/10);

set(gca, 'LineWidth', 2);

plot(x, y1, 'b-', 'LineWidth', 2, 'Marker', '*', 'MarkerSize', 8);
hold on;
plot(x, y2, 'g-', 'LineWidth', 2, 'Marker', 'o', 'MarkerSize', 8);
title('两物体速度变化曲线');
xlabel('时间(s)');
ylabel('速度(m/s)');
legend('2e^{-x}sin(x)-0.3', '0.2sin(\pi x+\pi/10)');
hold off;
