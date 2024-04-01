% 定义 x 的值
x = linspace(0, 2*pi, 101); % 在 0 到 2π 区间均匀取 101 个点

% 计算 y1、y2 和 y3 的值
y1 = x.^2;
y2 = cos(2*x);
y3 = y1 .* y2;

% 绘制三条曲线，分别指定颜色和线型
plot(x, y1, 'r--', 'LineWidth', 2); % 红色虚线，线宽为2
hold on; % 保持绘图区域，以便添加更多的曲线
plot(x, y2, 'g-.', 'LineWidth', 2); % 绿色点划线，线宽为2
plot(x, y3, 'b-', 'LineWidth', 2); % 蓝色实线，线宽为2

% 添加标签和标题
xlabel('X轴');
ylabel('Y轴');
title('（1）在同一坐标下系下用不同的颜色和线型绘制三条曲线。');
legend('y1 = x^2', 'y2 = cos(2x)', 'y3 = y1 * y2'); % 添加图例
grid on; % 添加网格线
