% 使用冒号表达式生成[100,999]的数值向量
numbers = 100:999;

% 使用rem函数计算每个数字除以21的余数
remainders = rem(numbers, 21);

% 使用find函数查找余数为0的索引
indices = find(remainders == 0);

% 使用length函数计算满足条件的数字的个数
count = length(indices);

% 打印结果
fprintf('[100,999]之间能被21整除的数的个数： %d\n', count);
