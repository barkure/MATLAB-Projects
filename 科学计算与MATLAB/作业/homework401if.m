% 使用if实现
while true
    % 输入百分制成绩或结束标志
    score = input('请输入百分制成绩或输入 "end" 结束程序: ', 's');

    % 检查是否输入为 "end"，如果是则退出循环
    if strcmpi(score, 'end')
        fprintf('程序已结束。\n');
        break;
    end

    % 将输入的字符串转换为数字
    score = str2double(score);

    % 判断成绩的合理性
    if isnan(score) || score < 0 || score > 100
        fprintf('错误：成绩不在0到100之间或输入无效\n');
    else
        % 使用 if 语句
        if score >= 90 && score <= 100
            grade = 'A';
        elseif score >= 80 && score < 90
            grade = 'B';
        elseif score >= 70 && score < 80
            grade = 'C';
        elseif score >= 60 && score < 70
            grade = 'D';
        else
            grade = 'E';
        end

        % 输出等级
        fprintf('成绩等级为: %s\n', grade);
    end
end
