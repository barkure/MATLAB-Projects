% 使用循环结构来求pi
n_values = [100, 1000, 10000];  % 不同的 n 值
approximations = zeros(size(n_values));  % 用于存储不同 n 值下的近似值

for i = 1:length(n_values)
    n = n_values(i);
    series_sum = 0;

    for j = 1:n
        series_sum = series_sum + 1/j^2;
    end

    approximations(i) = series_sum;
end

% 使用反函数计算 π
pi_approximations = sqrt(6 * approximations);

% 计算近似值的误差（与π的差）
errors = abs(pi_approximations - pi);

% 输出不同 n 值下的近似值和误差
disp('使用循环结构的近似值：');
disp(pi_approximations);
disp('误差：');
disp(errors);
