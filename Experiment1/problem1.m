% 从键盘输入一个3位整数
num = input('请输入一个3位整数: ');
% 计算反向的整数
reversed_num = 0;
while num > 0
   digit = mod(num, 10);  % 获取最后一位数字
   reversed_num = reversed_num * 10 + digit;  % 构建反向的整数
   num = floor(num / 10);  % 移除最后一位数字
end

% 显示反向的整数
fprintf('反向输出的整数为: %d\n', reversed_num);
