%定义系数矩阵 A 和右侧向量 b
A = [1/2 1/3 1/4;1/3 1/4 1/5;1/4 1/5 1/6];
b = [0.95;0.67;0.52];

%2.1 求解线性方程组
x_original = A \ b

%2.2 更改 b3 的值为 0.53
b(3) = 0.53;

% 再次求解方程组
x_new = A \ b

% 计算 b3 的相对变化
relative_change_b3 = (0.53 - 0.52) / 0.52;

% 计算解向量的相对变化
relative_change_x = norm(x_new - x_original) / norm(x_original);

fprintf('相对变化的 b3 值: %f\n', relative_change_b3);
fprintf('相对变化的解向量: %f\n', relative_change_x);
