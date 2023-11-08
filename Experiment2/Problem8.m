% 创建示例数据
[X, Y] = meshgrid(-10:0.2:10, -10:0.2:10);

% 初始化 Z
Z = zeros(size(X));

% 根据条件计算 Z 的值
condition1 = abs(X) > abs(Y);
condition2 = abs(X) <= abs(Y);

Z(condition1) = 0.3 * sin(-pi * Y(condition1) ./ X(condition1));
Z(condition2) = 0.3 * sin(pi * X(condition2) ./ Y(condition2));

% 创建图形窗口
figure;

% 绘制曲面图
surf(X, Y, Z);
title('函数曲面');
% 设置观察角度
view(-45, 45);
