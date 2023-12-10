clear;
x = 0:0.1:3;
f = @(x,y) [y(2);x.*sin(2*x)-x.*y(2)+exp(x).*y(1)];
[x,y] = ode45(f,[0,3],[-1,2]);
plot(x,y(:,1));
xlabel('x');
ylabel('y');
