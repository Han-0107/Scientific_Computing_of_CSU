f = @(x)[cos(x(1)) + x(2)*exp(x(1)) - 2; sin(x(2)) + x(1)*exp(x(2)) - 2];
solution = fsolve(f, [0.5, 0.5]);
disp("使用fsolve函数求解：")
disp(['Solution: x = ', num2str(solution(1)), ', y = ', num2str(solution(2))]);
