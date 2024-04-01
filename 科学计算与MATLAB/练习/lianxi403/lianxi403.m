% 打开文件 'MT1D_data.avg' 以只读方式
fileID = fopen('MT1D_data.avg', 'r');

% 从文件中读取数据并存储在矩阵 data_1 中，每行有 3 列
data_1 = fscanf(fileID, '%f', [3, inf]);

% 关闭文件
fclose(fileID);

% 转置矩阵 data_1，使数据按列存储
data_1 = data_1';

T = data_1(:, 1);
rho_a = data_1(:, 2);
phi = data_1(:, 3);

% 创建一个新图形
figure;


subplot(3, 1, 1);
semilogx(T, rho_a, '*b');
title('视电阻率-周期曲线');
xlabel('周期(s)');
ylabel('视电阻率 (\Omega\cdotm)');


subplot(3, 1, 2);
semilogx(T, phi, 'or');
title('相位-周期曲线');
xlabel('周期(s)');
ylabel('相位(\circ)');

% 计算磁导率 miu 和频率 f
miu = 4 * pi * 1e-7;
f = 1 ./ T;

% 计算深度 H 和电阻率 rho_H
H = sqrt(rho_a ./ (2 * pi * f * miu));
rho_H = rho_a .* ((pi / (2 * pi / 180 * phi)) - 1);

data_2 = [T, rho_a, phi, H, rho_H];
% 打开文件 'MT1D_inv.dat' 以只写方式
fileID_2 = fopen('MT1D_inv.dat', 'w');

% 将 data_2 写入文件 'MT1D_inv.dat'，每个值保留 3 位小数
fprintf(fileID_2, '%.3f\t%.3f\t%.3f\t%.3f\t%.3f\n', data_2);

% 关闭文件
fclose(fileID_2);

subplot(3, 1, 3)
stairs(H / 1000, rho_H, 'r');
set(gca, 'xscale', 'log');
set(gca, 'yscale', 'log');
xlabel('深度 (km)');
ylabel('电阻率 (\Omega\cdotm)');

% 设置 y 轴范围为 [1, 100]，x 轴范围为 [0.1, 100]
ylim([1, 100]);
xlim([0.1, 100]);
