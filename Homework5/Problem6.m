x0 = 0.6;
n=0;
while true
    x=-5/3*x0*x0;
    n=n+1;
    if abs(x-x0)<=1.0e-5
        disp('迭代数值结果为：');
        disp(x);
        disp('迭代次数为：');
        disp(n);
        break
    else
        x0=x;
    end
end
a=-(x+0.6)/0.6;
disp('计算误差为：');
disp(a);
