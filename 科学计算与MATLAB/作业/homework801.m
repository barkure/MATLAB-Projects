% 声明符号变量 x 和 y
syms x y;

% 定义一个复杂的代数表达式 z
z = (x + 1) / (sqrt(3 + x) - sqrt(y));

% 使用 subs 函数将 x 和 y 的具体值替换到表达式 z 中
result = subs(z, [x, y], [6, 5]);

% 打印结果
disp(result);
