% 创建一个文本文件textdemo.txt并写入数据
fileID = fopen('textdemo.txt', 'w');  % 打开文件以写入数据

% 写入表头
fprintf(fileID, 'Name           English          Chinese      Mathematics\n');

% 写入数据行
data = {
    'Wang             99              98                 100';
    'Li               98              89                 70';
    'Zhang            80              90                 97';
    'Zhao             77              65                 87'
};

for i = 1:numel(data)
    fprintf(fileID, '%s\n', data{i});
end

fclose(fileID);  % 关闭文件

% 使用读取函数打开文件并加载数据
fileID = fopen('textdemo.txt', 'r');  % 打开文件以读取数据

% 读取文件中的数据
formatSpec = '%s %d %d %d';  % 定义数据格式
data = textscan(fileID, formatSpec, 'HeaderLines', 1);  % 从第二行开始读取数据

fclose(fileID);  % 关闭文件

% 将数据加载到工作空间中
name = data{1};
english = data{2};
chinese = data{3};
mathematics = data{4};

% 创建一个表格来存储数据
tableData = table(name, english, chinese, mathematics);

% 显示加载的数据
disp(tableData);
