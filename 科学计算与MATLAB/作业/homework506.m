% 定义 s 和 t 的值
s = linspace(0, pi/2, 50);
t = linspace(0, 3*pi/2, 150);
[S,T] = meshgrid(s,t);

% 计算X Y Z的值
X = cos(S).*cos(T);
Y = cos(S).*sin(T);
Z = sin(S);

% 创建一个新窗口
figure;

% 绘制曲面图并进行插值着色处理
surf(X, Y, Z, 'EdgeColor', 'none', 'FaceColor', 'interp');
xlabel('X轴');
ylabel('Y轴');
zlabel('Z轴');
title('曲面图与插值着色');
colormap;
colorbar; % 添加颜色条

