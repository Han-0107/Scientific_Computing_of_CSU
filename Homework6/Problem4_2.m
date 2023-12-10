x=sym('x');
I2=int(x.^2./(exp(x)+1), 0, 2);
disp('符号积分方法结果：');
vpa(I2,6)
