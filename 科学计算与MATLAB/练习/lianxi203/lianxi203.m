load('MT2Dresult.mat');

% 视电阻率三维图（频率取对数）
figure;
subplot(2, 1, 1);

% 使用surf绘制视电阻率的三维图
surf(Distance, log10(f), pc);
title('视电阻率三维图');
xlabel('水平距离');
ylabel('频率 (对数)');
zlabel('视电阻率');
colormap('jet');

% 阻抗相位三维图（频率取对数）
subplot(2, 1, 2);

% 使用surf绘制阻抗相位的三维图，频率取对数
surf(Distance, log10(f), ph);
title('阻抗相位三维图');
xlabel('水平距离');
ylabel('频率 (对数)');
zlabel('阻抗相位');
colormap('jet');