% 创建一个新的极坐标图
fig = figure;
ax = polaraxes(fig);
polarplot(0, 0);  % 创建一个初始图，后续会删除

while true
    % 提示用户输入参数 a、b、n
    a = input('请输入参数 a: ');
    b = input('请输入参数 b: ');
    n = input('请输入参数 n: ');

    % 创建角度范围
    theta = linspace(0, 2*pi, 1000);

    % 绘制极坐标曲线
    h = polarplot(ax, theta, a * sin(b + n * theta));
    hold on;  % 保持之前的图像

    % 询问用户是否继续
    user_input = input('是否继续绘制新的曲线？(输入 "yes" 继续，其他任何输入退出): ', 's');
    
    % 如果用户不想继续，退出循环
    if ~strcmpi(user_input, 'yes')
        break;
    end
end

hold off; % 不再保持图像
title(ax, '极坐标曲线');