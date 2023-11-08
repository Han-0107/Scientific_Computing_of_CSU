x = 0:0.1:8;
y = zeros(size(x));

for i = 1:length(x)
    if x(i) <= 2
        y(i) = 0.5 * x(i);
    elseif x(i) > 2 && x(i) <= 6
        y(i) = 1.5 - 0.25 * x(i);
    else
        y(i) = 0.5;
    end
end

plot(x, y);
title('分段函数 f(x)');
xlabel('x');
ylabel('f(x)');
grid on;
