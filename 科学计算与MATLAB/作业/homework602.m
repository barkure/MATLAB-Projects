% 已知数据点
x_values = 1:10:101;  % 采样点的x值
lgx_values = [0,1.0414,1.3222,1.4914,1.6128,1.7076,1.7853,1.8513,1.9085,1.9590,2.0043];
% 对应的lg(x)值

% 进行5次多项式拟合
coefficients = polyfit(x_values, lgx_values, 5);  % 5次多项式拟合

% 构建拟合多项式
p = polyval(coefficients, x_values);

% 绘制lg(x)和拟合多项式的函数曲线
x_range = 1:0.1:101;  % 更密集的x范围以绘制平滑的曲线
lgx_range = log10(x_range);
p_range = polyval(coefficients, x_range);

% 绘图
plot(x_range, lgx_range, 'b', x_range, p_range, 'r');
legend('lg(x)', 'p(x)');
xlabel('x');
ylabel('y');
title('lg(x)和5次拟合多项式p(x)的函数曲线');
grid on;
