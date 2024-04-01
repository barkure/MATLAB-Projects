% 定义要积分的函数
I1 = @(t) sqrt(cos(t.^2)+4*sin((2*t).^2)+1);
I2 = @(x) log(1+x)./(1+x.^2);

% 计算I1的定积分
% 定义积分区间 [a1, b1]
a1 = 0; % 起始点
b1 = 2*pi; % 终止点

integral_result1 = quad(I1, a1, b1);

% 打印积分结果
fprintf('I1的定积分的近似值为：');
disp(integral_result1);


% 计算I2的定积分
% 定义积分区间 [a2, b2]
a2 = 0; % 起始点
b2 = 1; % 终止点

% 定义积分的步长
n2 = 1000; % 增加n以提高精度

% 计算步长h
h2 = (b2 - a2) / n2;

% 初始化积分结果
integral_result2 = 0;

% 使用梯形法计算定积分
for i = 1:n2
    x0 = a2 + (i - 1) * h2; % 左边界
    x1 = a2 + i * h2; % 右边界
    integral_result2 = integral_result2 + (I2(x0) + I2(x1)) / 2 * h2;
end

% 打印积分结果
fprintf('I2的定积分的近似值为: %.6f\n', integral_result2);