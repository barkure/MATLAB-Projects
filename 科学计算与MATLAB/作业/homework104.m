% 示例字符串
str = 'Guan Zhu Yong Chu Taffy Miao';

% 找到大写字母的位置
upperCaseIndices = find(str >= 'A' & str <= 'Z');

% 使用空矩阵[]删除找到的大写字母位置的字符
str(upperCaseIndices) = [];

% 显示结果
disp(str);
