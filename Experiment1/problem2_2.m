% 从键盘输入百分制成绩
score = input('请输入百分制成绩: ');

% 使用switch语句判断成绩等级
switch true
    case score >= 90 && score <= 100
        grade = 'A';
    case score >= 80 && score <= 89
        grade = 'B';
    case score >= 70 && score <= 79
        grade = 'C';
    case score >= 60 && score <= 69
        grade = 'D';
    case score >= 100 || score <= 0
        grade = 'N';
    otherwise
        grade = 'E';
end

% 显示成绩等级
if grade == 'N'
    fprintf('Error!\n');
else
    fprintf('成绩等级为: %s\n', grade);
end