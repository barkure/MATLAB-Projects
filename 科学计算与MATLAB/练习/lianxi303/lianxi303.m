data = load('aaa.xls');

x = data(:, 1);
y = data(:, 2);
z = data(:, 3);
z = -z;

[X, Y] = meshgrid(linspace(75, 200, 30),linspace(-50, 150, 30));

Z = griddata(x, y, z, X, Y, 'cubic');

subplot(1, 2, 1);
surf(X, Y, Z);
colormap('jet');
colorbar;
title('等值线图');
xlabel('x(m)');
ylabel('y(m)');

subplot(1, 2, 2);
contourf(X,Y,Z,[-5,0],'k');
title('水深小于5米的区域');
xlabel('x(m)');
ylabel('y(m)');