a=-3;
while a<=3
    y = (exp((0.3)*a)-exp((-0.3)*a))*sin(a+0.3)/2+log((0.3+a)/2);
    disp(y);
    a=a+0.1;
end

