u = linspace(0, 4*pi, 100);
v = linspace(0.001, 2, 100);
[u, v] = meshgrid(u, v);

x = cos(u) .* sin(v);
y = sin(u) .* sin(v);
z = cos(v) + log(tan(v./2) + u./5);

mesh(x, y, z);
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
