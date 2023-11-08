xi = 0.1:0.1:1;
yi = [1.987, 3.28, 6.16, 7.08, 7.34, 7.66, 9.58, 9.48, 9.30, 11.2];

coefficient = polyfit(xi, yi, 8);
x = 0.1:0.01:1;
fitted_poly = polyval(coefficient, x);

subplot(1,2,1);
plot(xi,yi,'o-');
subtitle('拟合前');
grid on;

subplot(1,2,2);
plot(x,fitted_poly,'-');
subtitle('拟合后');
grid on;
