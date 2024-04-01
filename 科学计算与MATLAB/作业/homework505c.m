% 定义 x 的值
x = linspace(0, 2*pi, 101); % 在 0 到 2π 区间均匀取 101 个点

% 计算 y1、y2 和 y3 的值
y1 = x.^2;
y2 = cos(2*x);
y3 = y1 .* y2;

% 创建一个新窗口
figure;

% 绘制条形图（Bar Plot） - y1 = x^2
subplot(3, 4, 1);
bar(x, y1, 'r');
xlabel('X轴');
ylabel('Y轴');
title('条形图 - y1 = x^2');
grid on;

% 绘制阶梯图（Stair Plot） - y1 = x^2
subplot(3, 4, 2);
stairs(x, y1, 'r');
xlabel('X轴');
ylabel('Y轴');
title('阶梯图 - y1 = x^2');
grid on;

% 绘制杆图（Stem Plot） - y1 = x^2
subplot(3, 4, 3);
stem(x, y1, 'b');
xlabel('X轴');
ylabel('Y轴');
title('杆图 - y1 = x^2');
grid on;

% 绘制填充图（Filled Plot） - y1 = x^2
subplot(3, 4, 4);
fill(x, y1, 'm');
xlabel('X轴');
ylabel('Y轴');
title('填充图 - y1 = x^2');
grid on;

% 绘制条形图（Bar Plot） - y2 = cos(2x)
subplot(3, 4, 5);
bar(x, y2, 'r');
xlabel('X轴');
ylabel('Y轴');
title('条形图 - y2 = cos(2x)');
grid on;

% 绘制阶梯图（Stair Plot） - y2 = cos(2x)
subplot(3, 4, 6);
stairs(x, y2, 'r');
xlabel('X轴');
ylabel('Y轴');
title('阶梯图 - y2 = cos(2x)');
grid on;

% 绘制杆图（Stem Plot） - y2 = cos(2x)
subplot(3, 4, 7);
stem(x, y2, 'b');
xlabel('X轴');
ylabel('Y轴');
title('杆图 - y2 = cos(2x)');
grid on;

% 绘制填充图（Filled Plot） - y2 = cos(2x)
subplot(3, 4, 8);
fill(x, y2, 'm');
xlabel('X轴');
ylabel('Y轴');
title('填充图 - y2 = cos(2x)');
grid on;

% 绘制条形图（Bar Plot） - y3 = y1 * y2
subplot(3, 4, 9);
bar(x, y3, 'r');
xlabel('X轴');
ylabel('Y轴');
title('条形图 - y3 = y1 * y2');
grid on;

% 绘制阶梯图（Stair Plot） -  y3 = y1 * y2
subplot(3, 4, 10);
stairs(x, y3, 'r');
xlabel('X轴');
ylabel('Y轴');
title('阶梯图 - y3 = y1 * y2');
grid on;

% 绘制杆图（Stem Plot） -  y3 = y1 * y2
subplot(3, 4, 11);
stem(x, y3, 'b');
xlabel('X轴');
ylabel('Y轴');
title('杆图 - y3 = y1 * y2');
grid on;

% 绘制填充图（Filled Plot） -  y3 = y1 * y2
subplot(3, 4, 12);
fill(x, y3, 'm');
xlabel('X轴');
ylabel('Y轴');
title('填充图 - y3 = y1 * y2');
grid on;