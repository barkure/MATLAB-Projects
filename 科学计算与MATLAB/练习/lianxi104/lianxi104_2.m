% 定义定义域的范围
x_min = -2;
x_max = 2;
y_min = -2;
y_max = 2;

% 定义网格点的分辨率
resolution = 0.1;

% 生成 x 和 y 的网格点
x = x_min:resolution:x_max;
y = y_min:resolution:y_max;

% 初始化用于存储函数值的向量
Z = zeros(1, length(x) * length(y));

% 使用一重循环计算函数值
for index = 1:length(x)*length(y)
    i = mod(index - 1, length(x)) + 1; % 计算 x 索引
    j = ceil(index / length(x)); % 计算 y 索引
    Z(index) = x(i) * exp(-x(i)^2 - y(j)^2);
end


% 可视化结果
[X, Y] = meshgrid(x, y);
Z = reshape(Z, length(x), length(y));
Z = transpose(Z); 
% 此处对矩阵Z进行转置，原因在于 MATLAB 默认排列方式是按列主序，直接输出会导致 x 和 y 颠倒

figure;
surf(X, Y, Z);
title('函数 Z = x * exp(-x^2 - y^2)');
xlabel('x');
ylabel('y');
zlabel('Z');
