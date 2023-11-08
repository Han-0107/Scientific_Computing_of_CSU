F1 = [3, 0, 1, 2];
F2 = [2, 3, 3];
F = conv(F1, F2);
G1 = [-2, -1, 2];
G2 = [1, 3];
G = conv(G1, G2);
G_real = [0, 0, G];

ans_1 = F + G_real;
disp("两个多项式的和为");
disp(ans_1);

[Q, r] = deconv(F, G);
disp("两个多项式的商为：");
disp(Q);
disp("两个多项式的余式为：");
disp(r);
