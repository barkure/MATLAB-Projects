all clear;
% 定义地层参数
v1 = 500;  % 第一层速度 (m/s)
v2 = 1200; % 第二层速度 (m/s)
v3 = 3600; % 第三层速度 (m/s)
h1 = 20;   % 第一层厚度 (m)
h2 = 10;   % 第二层厚度 (m)
i_12 = asin(v1/v2); 
i_23 = asin(v2/v3); 

% 创建时间间隔数组
x = -200:200;

% 计算直达波、折射波和反射波时距
t_direct = abs(x)/v1; % 直达波
t_refract_1 = abs(x)/v2+2*h1*cos(i_12)/v1; % 折射波1
t_reflect_1 = 1/v1*sqrt(4*h1^2+x.^2); % 反射波1
t_refract_2 = abs(x)/v3+2*h2*cos(i_23)/v2+2*h1*cos(i_12)/v1; % 折射波2
% 反射波2
t0 = 2*(h1/v1+h2/v2);
t1 = h1/v1;
t2 = h2/v2;
v_sigma = sqrt((t1*v1^2+t2*v2^2)/(t1+t2));
t_reflect_2 = sqrt(t0^2+x.^2/(v_sigma^2));

% 绘制时距曲线
plot(x, t_direct, 'b', 'LineWidth', 2); % 直达波
hold on;
plot(x, t_refract_1, 'g', 'LineWidth', 2); % 折射波1
plot(x, t_reflect_1, 'r', 'LineWidth', 2); % 反射波1
plot(x, t_refract_2, 'k', 'LineWidth', 2); % 折射波2
plot(x, t_reflect_2, 'c', 'LineWidth', 2); % 折射波2

xlabel('X (m)');
ylab el('t (s)');
legend('直达波', '折射波1', '反射波1', '折射波2', '反射波2');
title('时距曲线');
grid on;
