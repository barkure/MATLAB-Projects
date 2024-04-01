% 计算原始模型的电阻率 (rho_a) 和相位 (ph)，输入层电阻率和层厚度
[rho_a, ph] = MT1D_FWD([10 200 10], [500 2000]);

% 生成一组时间常数 T，共40个数值，用于频谱分析
T = logspace(-3, 4, 40);

% 物理常数
miu = (4e-7) * pi;

% 计算深度参数 D，pd 和 D 是用于反演的
D = sqrt((rho_a .* T) / (2 * pi * miu));
pd = rho_a .* (180 ./ (2 * ph) - 1);

% 创建一个新的图形窗口
figure;

% 子图 1：绘制原始模型和反演模型的电阻率曲线
subplot(3, 1, 1);
depth = [1 500 2000 100000];  % 模型深度
rho = [10 200 10 10];        % 模型电阻率
stairs(depth / 1000, rho);    % 绘制理论模型
hold on
h = stairs(D / 1000, pd);     % 绘制Bostick反演模型

set(h, 'color', 'r');         % 设置反演模型的颜色为红色
set(gca, 'xscale', 'log');    % 设置x轴为对数坐标
set(gca, 'yscale', 'log');    % 设置y轴为对数坐标
xlim([10^(-3) 10^(2)]);       % 设置x轴的显示范围
ylim([10^(0) 10^(3)]);        % 设置y轴的显示范围
xlabel('深度(km)');           % 设置x轴标签
ylabel('电阻率(\Omega\cdotm)'); % 设置y轴标签
legend('原始模型', '反演模型'); % 添加图例

% 计算反演模型的层厚度 h
h = diff(D);

% 计算反演模型的电阻率 (rho_a1) 和相位 (ph1)，输入视电阻率 pd 和层厚度 h
[rho_a1, ph1] = MT1D_FWD(pd, h);

% 子图 2：绘制原始模型和反演模型的电阻率响应
subplot(3, 1, 2);
semilogx(T, rho_a, '*');      % 原始模型响应
hold on 
semilogx(T, rho_a1, 'r');    % 反演模型响应
xlabel('T(s)');                % 设置x轴标签
ylabel('\rho_a(\Omega\cdotm)'); % 设置y轴标签
legend('原始模型响应', '反演模型响应'); % 添加图例

% 子图 3：绘制原始模型和反演模型的相位响应
subplot(3, 1, 3);
semilogx(T, ph, '*');         % 原始模型相位响应
hold on 
semilogx(T, ph1, 'r');       % 反演模型相位响应
xlabel('T(s)');                % 设置x轴标签
ylabel('phase(\circ)');        % 设置y轴标签
legend('原始模型响应', '反演模型响应'); % 添加图例
