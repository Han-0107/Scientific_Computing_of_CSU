% 创建一个随机的5x6矩阵
matrix = randi([1, 100], 5, 6);

% 获取矩阵的行数
numRows = size(matrix, 1);

% 要求用户输入n值
n = input('请输入n值（1到5之间）: ');

% 检查n值是否在合法范围内
if n >= 1 && n <= numRows
    % 输出第n行元素
    disp(['第', num2str(n), '行元素为:']);
    disp(matrix(n, :));
else
    % 超出合法范围，输出最后一行元素并给出错误信息
    disp('错误：n值超出矩阵的行数范围。');
    disp(['最后一行元素为:']);
    disp(matrix(numRows, :));
end
