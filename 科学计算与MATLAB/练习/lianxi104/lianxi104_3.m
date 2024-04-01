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

% 使用向量运算计算函数值
[X, Y] = meshgrid(x, y);
Z = X .* exp(-X.^2 - Y.^2);

% 可视化结果
figure;
surf(X, Y, Z);
title('函数 Z = x * exp(-x^2 - y^2)');
xlabel('x');
ylabel('y');
zlabel('Z');
