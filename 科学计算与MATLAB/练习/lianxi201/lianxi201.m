% 加载MT1Dresult.mat文件
load('MT1Dresult.mat');

% 绘制视电阻率-频率曲线
figure;
subplot(2, 1, 1);
semilogx(f, pc, '-b'); % 使用对数坐标轴绘制视电阻率-频率曲线
title('视电阻率-频率曲线');
xlabel('频率');
ylabel('视电阻率');
grid on;

% 绘制相位-频率曲线
subplot(2, 1, 2);
semilogx(f, ph, '-b'); % 使用对数坐标轴绘制相位-频率曲线
title('相位-频率曲线');
xlabel('频率');
ylabel('相位');
grid on;
