% 定义 x 和 y 的值
x = linspace(-5, 5, 21);
y = linspace(0, 10, 31);
[X, Y] = meshgrid(x, y);

% 定义要绘制的函数
Z = cos(X).*cos(Y).*exp(-sqrt(X.^2+Y.^2)/4);

% 创建一个新窗口，并分为两个子图
figure;

% 绘制曲面图在第一个子图中
subplot(2, 1, 1);
surf(X, Y, Z);
xlabel('X轴');
ylabel('Y轴');
zlabel('Z轴');
title('曲面图');
colormap;

% 绘制等高线图在第二个子图中
subplot(2, 1, 2);
contour(X, Y, Z);
xlabel('X轴');
ylabel('Y轴');
title('等高线图');
colormap;
colorbar; % 添加颜色条
