clear;
% 定义球体参数
G = 6.67*10^-2;
R = 50;
D = 100;
sigma = 1;
M = 4/3*(pi*R^3*sigma);

% 定义定义域的范围
x = -200:10:200;
y = -200:10:200;

% 二度球体重力异常
delta_g_2 = G*M*D./((x.^2+D^2).^(3/2));

figure;
subplot(2, 2, 1);
plot(x, delta_g_2, 'b-');
title('二度球体重力异常');
xlabel('X/m');
ylabel('Δg/g.u.');
grid on;


% 三度球体等值线图
[X, Y] = meshgrid(x, y);
delta_g_3 = G*M*D./((X.^2+Y.^2+D^2).^(3/2));

subplot(2, 2, 2);
contourf(X, Y, delta_g_3,10);
colorbar;
title('三度球体重力异常等值线图');
xlabel('X(m)');
ylabel('Y(m)');

subplot(2, 2, [3,4]);
surf(X,Y,delta_g_3);
colorbar;
title('三度球体重力异常三维曲面图');
xlabel('X/m');
ylabel('Y/m');
zlabel('Δg/g.u.');
colormap('jet');
