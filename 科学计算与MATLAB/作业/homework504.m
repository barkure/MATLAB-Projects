% 定义 x 的值
x = linspace(0, 2*pi, 101); % 在 0 到 2π 区间均匀取 101 个点

% 计算对应的 y 值
y = (0.5+3*sin(x)./(1+x.^2)).*cos(x);

% 绘制函数曲线
plot(x, y);
xlabel('X轴');
ylabel('Y轴');
title('y = (0.5+3*sin(x)./(1+x.^2)).*cos(x) 曲线');
grid on; % 添加网格线