% 打开数据文件进行读取
fileID = fopen('MT_data(1) (1).txt','r');

% 使用textscan读取数据
data = textscan(fileID, '%s %s %s', 'Delimiter', ' ');

% 关闭文件
fclose(fileID);

% 转换为数值
T = str2double(data{1});
rho_a = str2double(data{2});
phi_a = str2double(data{3});

% 设置地层参数
n = length(T); % 数据点数
h = zeros(n, 1); % 存储深度
rho_h = zeros(n, 1); % 存储真电阻率
miu = 4 * pi * 1e-7; % 磁导率

% 使用公式计算深度
f = 1./T;
h = sqrt(rho_a ./ (2 * 180 .* f * miu));
% 使用公式计算真电阻率
rho_h = rho_a .* (180 ./ (2 .* phi_a) - 1);

figure;
loglog(h, rho_h, 'b-', 'LineWidth', 2);

xlabel('深度 h (m)');
ylabel('真电阻率 \rho_h (\Omega\cdot m)');
title('真电阻率与深度关系');
grid on;
hold on;

xline(1000, 'r--', '1000米地层');
xline(1500, 'r--', '1500米地层');
yline(100, 'r--', '100\Omega\cdot m电阻率');
yline(500, 'r--', '500\Omega\cdot m电阻率');