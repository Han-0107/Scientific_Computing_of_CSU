function Func1(matrix_order)
    % 生成随机矩阵
    matrix = randi([0, 100], matrix_order, matrix_order);
    
    % 初始化存储结果的数组
    values = [];
    row_indices = [];
    col_indices = [];

    % 遍历矩阵元素，查找15的倍数（除0以外）
    for i = 1:matrix_order
        for j = 1:matrix_order
            if mod(matrix(i, j), 15) == 0 && matrix(i, j) ~= 0
                values = [values, matrix(i, j)];
                row_indices = [row_indices, i];
                col_indices = [col_indices, j];
            end
        end
    end
    disp(matrix);
    disp('The values of them:');
    disp(values);
    disp('The row locations of them:');
    disp(row_indices);
    disp('The col locations them:');
    disp(col_indices);
end
