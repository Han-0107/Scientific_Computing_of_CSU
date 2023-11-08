% 创建示例数据
lambda = 5.893e-7; % 波长（光的波长）
I0 = 1;
R = 2;
[X, Y] = meshgrid(-10:0.1:10, -10:0.1:10);
% 创建一个表示 r 值的网格
r = sqrt(X.*X+Y.*Y);

% 计算牛顿环的干涉图样
I = 4.*I0.*power(cos(pi.*(r.*r/R+lambda/2)./lambda), 2);

% 创建图形窗口
figure;

% 绘制牛顿环的干涉图样
surf(X, Y, I);
title('牛顿环的干涉图样');
xlabel('x');
ylabel('y');

grid on;
colormap('parula'); % 更改色彩映射为'jet'
colorbar; % 添加颜色栏
view(0,70);
