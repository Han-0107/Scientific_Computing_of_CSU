% 从键盘输入百分制成绩
score = input('请输入百分制成绩: ');

% 判断成绩等级
if score >= 90 && score <= 100
    grade = 'A';
    fprintf('成绩等级为: %s\n', grade);
elseif score >= 80 && score <= 89
    grade = 'B';
    fprintf('成绩等级为: %s\n', grade);
elseif score >= 70 && score <= 79
    grade = 'C';
    fprintf('成绩等级为: %s\n', grade);
elseif score >= 60 && score <= 69
    grade = 'D';
    fprintf('成绩等级为: %s\n', grade);
elseif score >= 100 || score <= 0
    fprintf('Error!\n');
else
    grade = 'E';
    fprintf('成绩等级为: %s\n', grade);
end
