% 定义参数 a 和 b
a = 2;
b = 3;

% 创建一个网格以生成 x 和 y 坐标
[x, y] = meshgrid(-2:0.1:2, -2:0.1:2);

% 计算双曲抛物面的 z 坐标
z = (x.^2 / a^2) - (y.^2 / b^2);

% 定义参数方程
f_x = @(r, t) 2.*r.*cos(t);
f_y = @(r, t) 2.*r.*sin(t);
f_z = @(r, t) 2.*r.*r.*sin(2.*t);

subplot(2,3,1);
surf(x, y, z);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('surf');
view(10,60);

subplot(2,3,2);
fsurf(f_x, f_y, f_z, [0, 1, 0, 2*pi]);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('fsurf');
view(10,60);

subplot(2,3,3);
mesh(x, y, z);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('mesh');
view(10,60);

subplot(2,3,4);
fmesh(f_x, f_y, f_z, [0, 1, 0, 2*pi]);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('fmesh');
view(10,60);

subplot(2,3,5);
surface(x, y, z);
xlabel('X');
ylabel('Y');
zlabel('Z');
title('surface');
view(10,60);
