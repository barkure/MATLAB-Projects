data = load('os110306_11.dat'); % 加载dat文件到data变量

fs = 1;  % 采样频率（每秒一个数据点）
lowcut = 1/20;  % 最大周期20s的倒数，带通滤波器的低截止频率
highcut = 1/4;  % 最小周期4s的倒数，带通滤波器的高截止频率
order = 6;  % 滤波器阶数

[b, a] = butter(order, [lowcut, highcut]/(fs/2), 'bandpass');  % 设计带通滤波器
% 根据奈奎斯特–香农采样定理，应以采样频率 fs 的一半为单位

gravity_data = data(:, 3);  % 第三列是重力数据
filtered_data = filtfilt(b, a, gravity_data);  % 应用滤波器

date = data(:, 1);  % 获取日期列的数值数据
time = data(:, 2);  % 获取时间列的数值数据

% 提取小时、分钟和秒
hours = floor(time / 10000);  % 提取小时部分
minutes = mod(floor(time / 100), 100);  % 提取分钟部分
seconds = mod(time, 100);  % 提取秒部分

% 将时间数值转换为小时（以小数表示）
time_to_hours = hours + minutes / 60 + seconds / 3600;
% 要将日期date转换为 datenum 格式的日期
date_numeric = datetime(date, 'ConvertFrom', 'yyyyMMdd');


% 合并日期和时间数值
datetime_numeric = date_numeric + time_to_hours / 24;  % 将小时转换为天

% 此时，datetime_numeric 变量中存储了合并的数值，以天为单位

% 绘制图表（以实际日期为单位）
figure;
plot(datetime_numeric, gravity_data, 'b', 'LineWidth', 2, 'DisplayName', '原始数据');
hold on;
plot(datetime_numeric, filtered_data, 'r', 'LineWidth', 2, 'DisplayName', '滤波后的数据');
% 设置纵坐标的限制
ylim([-100, 100]);
xlabel('日期');
ylabel('重力数据');
title('重力数据滤波');
legend('show');
grid on;

