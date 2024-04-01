% 假设有一个数据矩阵 data，其中包含 Ex(t) 的时域数据
data_ex = load('YJBhy.dat');

% 获取数据点数
N = length(data_ex);

% 生成点号序列
point_numbers = 1:N;

% 将数据转换为毫伏（mV）
data_ex_mV = data_ex * 1000; % 乘以1000将单位从V转换为mV

% 设置横轴范围
x_limit = 512; % 你希望的横轴范围
point_numbers_subset = point_numbers(point_numbers <= x_limit);
data_ex_mV_subset = data_ex_mV(1:x_limit);

% 设置纵轴范围
y_limit = 5000; % 你希望的纵轴范围
ylim([-y_limit, y_limit]);

% 绘制图像
figure;
plot(point_numbers_subset, data_ex_mV_subset);
xlabel('数据点号');
ylabel('Ex(t) (mV)'); % 纵轴单位为mV
title('Ex(t) 数据点号图');
grid on;
