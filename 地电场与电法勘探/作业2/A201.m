% 地物2101 齐鑫瑶
% 线号190，点号252
% 定义参数
AB = 1212.5;  % AB供电偶极长
r = 9215;  % 收发距(测点到AB中点)
theta = 87.48;  % 夹角(度)测点到AB中点连线与AB夹角
mu_0 = 4 * pi * 1e-7; % 真空磁导率

% 读入数据
data = readmatrix('data.csv');

rho_wide = zeros(1, 14);
n = 1;
for j = 1:1:6
    n = 10 * n;
    for i = 1:14
        frequency = data(i, 1);  % 频率
        rho_CSAMT = data(i, 2);  % CSAMT电阻率
        I = data(i, 3);  % 电流
        E = data(i, 4);  % E振幅
        
        % 根据不同的电阻率值计算电场并找到最接近的电场
        rho = logspace(0, 6, n);
        omega = 2 * pi * frequency;
        k = sqrt(1i * omega * mu_0 ./ rho);
        Ex = abs(((I * AB * rho_CSAMT) * (1 + (1 - 1i * k * r) .* exp(1i * k * r) - 3 * cos(theta) * cos(theta))) / (2 * pi * r^3)) * 1e7;
        f1 = @(Ex) abs(E - Ex);
        Ex_min = fminbnd(f1, Ex(1, n), Ex(1, 1));
        
        % 找到与Ex_min最接近的电场值，并获取其对应的电阻率
        [~, index] = min(abs(Ex(:) - Ex_min));
        Ex_real = Ex(index);
        rho_wide(1, i) = rho(index);
    end
    
    subplot(3, 2, j);
    x = log2(data(:, 1));
    plot(x, data(:, 2), 'r');
    hold on;
    plot(x, rho_wide, 'b');
    legend(["CSAMT电阻率", "广域电阻率"]);
    title(['n = ', num2str(n)]);
    xlabel('log2(frequency)/Hz');
    ylabel('\rho_{wide}/Ω·m');
end

% 设置整个图的标题
sgtitle('频率对应的 CSAMT 电阻率与广域电阻率比较');

% 构造表格数据
resultTable = array2table([data, rho_wide'], 'VariableNames', {'频率', 'CSAMT电阻率', '电流', 'E振幅', '广域电阻率'});

% 将结果写入 CSV 文件
writetable(resultTable, 'output.csv', 'Delimiter', ',');