% 定义分段函数的不同部分
x1 = -5:0.1:0;       % 第一部分的 x 范围
y1 = (x1+sqrt(pi))*exp(-2);   % 第一部分的函数值

x2 = 0:0.1:5;        % 第二部分的 x 范围
y2 = 1/2*log(x2+sqrt(1+x2.^2));      % 第二部分的函数值


% 绘制分段函数的曲线
plot(x1, y1, 'b', x2, y2, 'g')
title('分段函数曲线')
xlabel('x')
ylabel('f(x)')
legend('y1 = (x1+sqrt(pi))*exp(-2)', 'y2 = 1/2*log(x2+sqrt(1+x2^2))')
grid on
