function Func33(months)
    R = zeros(1, months+1);  % 修正初始化语法
    F = zeros(1, months+1);  % 修正初始化语法
    R(1) = 1000;
    F(1) = 1000;
    for i = 1:months
        R(i+1) = 1.1 * R(i) - 0.2 * F(i);
        F(i+1) = 0.2 * R(i) + 0.6 * F(i);
    end
    disp(R(months+1));
    disp(F(months+1));
    % 绘制两个图线，自变量使用默认值
    plot(R, 'r-', 'LineWidth', 2);
    hold on;  % 保持图表，以便在同一个图中绘制第二个图线
    plot(F, 'b--', 'LineWidth', 2);

    xlabel('月份');
    ylabel('动物数量');

    % 添加图例
    legend('兔子', '狐狸');

    % 设置x轴范围从0开始
    xlim([1, months]);

    % 停止保持图表
    hold off;
end
