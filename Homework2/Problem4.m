% 生成1到100之间的随机整数
random_number = randi([1, 100]);

% 初始化游戏参数
attempts = 0;
max_attempts = 7;
guessed_correctly = false;

fprintf('欢迎参加猜数字游戏！\n');
fprintf('我已经生成了一个1到100之间的整数。\n');

while attempts < max_attempts
    % 获取用户的猜测
    user_guess = input('请输入你的猜测: ');

    % 检查用户的猜测
    if user_guess == random_number
        fprintf('You won! 你猜对了，答案是 %d。\n', random_number);
        guessed_correctly = true;
        break;
    elseif user_guess < random_number
        fprintf('Lower. 请尝试更大的数。\n');
    else
        fprintf('Higher. 请尝试更小的数。\n');
    end
    
    attempts = attempts + 1;
end

if ~guessed_correctly
    fprintf('游戏结束。你没有猜中。答案是 %d。\n', random_number);
end
