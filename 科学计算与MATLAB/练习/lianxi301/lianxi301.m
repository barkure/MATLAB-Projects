% （1）使用 importdata 导入
data1 = importdata('Demogrid.dat');

fileID = fopen('dw17_1.txt', 'w');
% 写入data1的内容到文件
fprintf(fileID, '%f %f %f\n', data1.data.');

% 关闭文件
fclose(fileID);

fprintf('数据已成功写入文件\n');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (2)使用 fscanf 读入
fileID = fopen('Demogrid.dat', 'r');

% 跳过表头行
headerLine = fgetl(fileID);

% 读取数据
data2 = fscanf(fileID, '%f', [3, inf]); % 每行包含3列数据

% 关闭文件
fclose(fileID);

data2 = data2';

fileID = fopen('dw17_2.txt', 'w');
% 写入data1的内容到文件
fprintf(fileID, '%f %f %f\n', data2');

% 关闭文件
fclose(fileID);

fprintf('数据已成功写入文件\n');
