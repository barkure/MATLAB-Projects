% 定义定义域的范围
x_min = -2;
x_max = 2;
y_min = -2;
y_max = 2;

% 定义网格点的分辨率
resolution = 0.1;

% 生成 x 和 y 的网格点
[x, y] = meshgrid(x_min:resolution:x_max, y_min:resolution:y_max);

% 初始化用于存储函数值的矩阵
Z = zeros(size(x));

% 使用二重循环计算函数值
for i = 1:size(x, 1)
    for j = 1:size(x, 2) 
        Z(i, j) = x(i, j) * exp(-x(i, j)^2 - y(i, j)^2);
    end
end

% 可视化结果
figure;
surf(x, y, Z);
title('函数 Z = x * exp(-x^2 - y^2)');
xlabel('x');
ylabel('y');
zlabel('Z');
