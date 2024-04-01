% 定义函数f(x)
f_x = @(x) det([x x^2 x^3; 1 2*x 3*x^2; 0 2 6*x]);

% 设置要计算导数的点
x_values = [1, 2, 3];

% 计算导数
for i = 1:length(x_values)
    x_val = x_values(i);
    h = 1e-6; % 微小的增量
    df_x = (f_x(x_val + h) - f_x(x_val)) / h;
    
    % 打印结果
    fprintf('x = %d时f(x)的导数为:\n', x_val);
    disp(df_x);
end
