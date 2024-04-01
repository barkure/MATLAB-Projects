% 加载MT2Dresult.mat文件
load('MT2Dresult.mat');

% 视电阻率-频率对数坐标等值线图
figure;
subplot(2, 1, 1);
pcolor(Distance, log10(f), log10(pc));
shading interp;
colorbar;
title('视电阻率-频率对数坐标等值线图');
xlabel('水平距离');
ylabel('频率（对数）');
colormap('jet');

% 阻抗相位-频率对数坐标等值线图
subplot(2, 1, 2);
pcolor(Distance, log10(f), ph);
shading interp;
colorbar;
title('阻抗相位-频率对数坐标等值线图');
xlabel('水平距离');
ylabel('频率（对数）');
colormap('jet');
