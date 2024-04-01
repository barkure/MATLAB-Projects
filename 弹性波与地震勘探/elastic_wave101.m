% 一维声波方程的显式差分解法
clear all;

% 创建VideoWriter对象并指定输出文件名
outputVideo = VideoWriter('elastic_wave101.avi');
open(outputVideo);

% 网格剖分信息
Nx = 201;            % 网格点的数量
dx = 10;             % 空间步长
x = 0:dx:(Nx-1)*dx;  % 空间坐标数组

% 震源信息
T = 1;               % 模拟的总时间
dt = 0.001;          % 时间步长
N = T / dt + 1;      % 时间步数
f = 10;              % 震源的频率
t0 = 0.1;            % 震源的起始时间
srcx = round(Nx/2);  % 震源位置在网格中心

% 介质信息
v = zeros(Nx, 1) + 2500;  % 声波速度分布（均匀值）
cfl = max(v) * dt / dx;   % 计算CFL数（Courant-Friedrichs-Lewy数），用于稳定性检查。如果CFL数大于等于1，会显示一条不满足稳定性条件的消息。

if cfl >= 1
    disp('不满足稳定性条件');
end

u = zeros(Nx, N + 2);  % 存储波场数据的二维数组
const = (v.^2) * (dt^2 / dx^2);  % 差分方程中的常数

for k = 2:N+1  % 主循环，从第二个时间步开始
    t = (k-2) * dt;  % 当前时间

    % 在震源位置应用Ricker波形，将其添加到波场数据中
    u(srcx, k) = ricker(f, t, t0);

    % 在嵌套循环中，通过差分方程更新波场数据
    for i = 2:Nx-1
        u(i, k+1) = (2 * u(i, k) - u(i, k-1)) + const(i, 1) * (u(i+1, k) - 2 * u(i, k) + u(i-1, k));
    end

    % 绘制波场随空间变化的图像
    plot(x, u(:, k+1));
    xlabel('Distance(m)');
    ylabel('Displacement(m)');
    title(['t=', num2str(1000 * t), 'ms']);
    set(gca, 'YLim', [-1 1]);

    % 将当前图形帧添加到VideoWriter对象
    writeVideo(outputVideo, getframe(gcf));
    
    pause(0.01);  % 暂停以观察波场演化
end


% 关闭VideoWriter对象
close(outputVideo);

% 清除图形
close;