% 创建示例数据
[X, Y] = meshgrid(-1:0.1:1, -1:0.1:1);
Z1 = 4.*X.^2 + Y.^2;
Z2 = 2 - X.*X;

% 创建图形窗口
figure;

% 绘制第一个曲面图
surf(X, Y, Z1);

hold on;
% 绘制第二个曲面图
surf(X, Y, Z2);
title('曲面图');
xlabel('x');
ylabel('y');
zlabel('z');

% 设置颜色条
colorbar;

% 设置观察角度
view(-10, 10);

hold off;