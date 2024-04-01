% (1) 求p(x)=p1(x)+p2(x)*p3(x)
% 定义多项式 p1(x)、p2(x) 和 p3(x)
p1 = [1, 2, 4, 0, 5];  % x^4 + 2x^3 + 4x^2 + 5
p2 = [1, 2];  % x + 2
p3 = [1, 2, 3];  % x^2 + 2x + 3

% 计算 p2(x) * p3(x)
product_p2_p3 = conv(p2, p3);  % p2(x) * p3(x)

% 手动相加多项式并构建表达式
max_length = max(length(p1), length(product_p2_p3));
p1 = [zeros(1, max_length - length(p1)), p1];
product_p2_p3 = [zeros(1, max_length - length(product_p2_p3)), product_p2_p3];
p = p1 + product_p2_p3;

% 构建多项式的表达式
expression = '';
for i = 1:length(p)
    if p(i) ~= 0
        if i == 1
            term = num2str(p(i));
        else
            term = [num2str(p(i)), 'x^', num2str(i - 1)];
        end
        if p(i) > 0 && i > 1
            term = ['+', term];
        end
        expression = [expression, term];
    end
end

% 打印多项式的表达式
disp(['(1) p(x) 的表达式：p(x)=', expression]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (2) 求p(x) 的根
% 计算 p(x) 的根
roots_of_p = roots(p);

% 打印多项式的根
disp('(2) p(x) 的根：');
disp(roots_of_p);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (3) 在当x取矩阵A的每一个元素时，求p(x)的值
% 定义矩阵 A
A = [-1, 1.2, 1.4;0.75, 2, 3.5;0, 5, 2.5];

% 初始化用于存储 P(x) 的值的矩阵
P_values = zeros(size(A));

% 对矩阵 A 的每个元素应用 P(x)
for i = 1:size(A, 1)
    for j = 1:size(A, 2)
        x = A(i, j);
        P_values(i, j) = polyval(p, x);
    end
end

% 打印p(x)的值
fprintf('(3) 在当x取矩阵A的每一个元素时，p(x)的值如下：\n    同时绘制了p(x)，请在生成的图形窗口查看\n')
disp(P_values);

% 绘制 P(x) 的值
figure;
surf(P_values);
xlabel('列索引');
ylabel('行索引');
zlabel('P(x) 值');
title('P(x) 在矩阵 A 中的值');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% (4) 在当以矩阵A为自变量时，求p（x）的值
% 应用多项式到矩阵 A
result_matrix = polyval(p, A);
% 打印计算结果
disp('(4) 以矩阵为自变量时，p(x)的值：');
disp(result_matrix);