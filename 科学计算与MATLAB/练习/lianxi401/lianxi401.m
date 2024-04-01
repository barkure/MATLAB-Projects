% 创建时间常数数组 T，包含40个对数均匀分布的数值，范围从 10^-3 到 10^4
T = logspace(-3, 4, 40);

% 调用 MT1D_FWD 函数，传入参数 [100 600] 和 1800，获取电阻率 (rho_a) 和相位 (phase) 数据
[rho_a, phase] = MT1D_FWD([100 600], 1800);

% 创建第一个子图，用于绘制电阻率 (rho_a)
subplot(2, 1, 1);

% 使用 semilogx 函数在对数坐标上绘制 T 和 rho_a 数据，线型为 '-*'（实线和星号标记）
semilogx(T, rho_a, '-*')

% 设置x轴标签为 "T(s)"，表示时间
xlabel('T(s)');

% 设置y轴标签为 "\rho_a(\Omega\cdotm)"，表示电阻率
ylabel('\rho_a(\Omega\cdotm)');

% 创建第二个子图，用于绘制相位 (phase)
subplot(2, 1, 2);

% 使用 semilogx 函数在对数坐标上绘制 T 和 phase 数据，线型为 '-*'（实线和星号标记）
semilogx(T, phase, '-*')

% 设置x轴标签为 "T(s)"，表示时间
xlabel ('T(s)');

% 设置y轴标签为 "phase(\circ)"，表示相位
ylabel ('phase(\circ)');
