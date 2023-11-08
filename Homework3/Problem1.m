t = linspace(0, 2 * pi, 100);  % 创建一个参数 t 的范围
x = power(cos(t), 2);  % 参数方程 x(t)
y = 1./(1 + 2.*t);  % 参数方程 y(t)
z = atan(t);  % 参数方程 z(t)

subplot(1, 3, 1); 
plot3(x, y, z, 'b-'); 
xlabel('X');
ylabel('Y');
zlabel('Z');
title('plot3');
view(10,10);
grid on;

subplot(1, 3, 2); 
fplot3(@(t) power(cos(t), 2), @(t) 1./(1 + 2.*t), @(t) atan(t), [0, 2 * pi]);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('fplot3');
view(10,10);
grid on;

subplot(1, 3, 3);
line(x, y, z, 'Color', 'b');
xlabel('X');
ylabel('Y');
zlabel('Z');
title('line');
view(10,10);
grid on;