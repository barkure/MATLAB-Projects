
% 打开文件以供读取
fileID = fopen('Demogrid.dat', 'r');

% 跳过表头行
headerLine = fgetl(fileID);

% 读取数据
data = fscanf(fileID, '%f', [3, inf]); % 每行包含3列数据

% 关闭文件
fclose(fileID);

data = data';

easting = data(:, 1); % 提取东经坐标
northing = data(:, 2); % 提取北纬坐标
elevation = data(:, 3); % 提取海拔高程

[xq, yq] = meshgrid(linspace(min(easting), max(easting), 50), linspace(min(northing), max(northing), 50)); % 创建一个均匀的目标网格

zq = griddata(easting, northing, elevation, xq, yq, 'cubic');

contourf(xq, yq, zq, 20);
colormap('jet');
colorbar;
title('等值线图');
xlabel('东经');
ylabel('北纬');

