% 计算f(x) = e^x 在x=[0, 1]内的值
x = linspace(0, 1, 100);  % 生成从0到1均匀分布的100个点
f_x = exp(x);  % 计算f(x)

% 将结果写入文件my.txt
fileID = fopen('my.txt', 'w');  % 打开文件以写入数据
fprintf(fileID, '%f\n', f_x);  % 将数据写入文件，每行一个值
fclose(fileID);  % 关闭文件

% 清除工作空间
clear;

% 使用读入函数调入文件my.txt
fileID = fopen('my.txt', 'r');  % 打开文件以读取数据
read_data = fscanf(fileID, '%f');  % 读取文件中的数据
fclose(fileID);  % 关闭文件

% 检查读入的数据是否正确
disp(read_data);
