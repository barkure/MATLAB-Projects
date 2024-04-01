% 定义 x 的值
x = linspace(0, 2*pi, 101); % 在 0 到 2π 区间均匀取 101 个点

% 计算 y1、y2 和 y3 的值
y1 = x.^2;
y2 = cos(2*x);
y3 = y1 .* y2;

% 创建一个新窗口
figure;

% 第一个子图：绘制 y1 = x^2
subplot(3, 1, 1); % 创建 3x1 网格布局，进入第一个子图
plot(x, y1, 'r--', 'LineWidth', 2); % 红色虚线，线宽为2
xlabel('X轴');
ylabel('Y轴');
title('y1 = x^2');
grid on;

% 第二个子图：绘制 y2 = cos(2x)
subplot(3, 1, 2); % 创建 3x1 网格布局，进入第二个子图
plot(x, y2, 'g-.', 'LineWidth', 2); % 绿色点划线，线宽为2
xlabel('X轴');
ylabel('Y轴');
title('y2 = cos(2x)');
grid on;

% 第三个子图：绘制 y3 = y1 * y2
subplot(3, 1, 3); % 创建 3x1 网格布局，进入第三个子图
plot(x, y3, 'b-', 'LineWidth', 2); % 蓝色实线，线宽为2
xlabel('X轴');
ylabel('Y轴');
title('y3 = y1 * y2');
grid on;