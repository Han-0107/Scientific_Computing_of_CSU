[U, V] = meshgrid(0:0.1:pi, 0:0.1:pi);
X = (1+cos(U)).*cos(V);
Y = (1+cos(U)).*sin(V);
Z = sin(U);

surf(X, Y, Z);