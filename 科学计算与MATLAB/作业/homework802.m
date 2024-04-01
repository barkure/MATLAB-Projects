% 声明符号变量 beta1、beta2 和 x
syms beta1 beta2 x;

% 定义表达式
f1 = sin(beta1) * cos(beta2) - cos(beta1) * sin(beta2);
f2 = (4 * x^2 + 8 * x + 3) / (2 * x + 1);

% 使用 simplify 函数简化表达式
f1_simple = simplify(f1);
f2_simple = simplify(f2);

% 打印化简结果
disp('f1的化简结果为:');
disp(f1_simple);
disp('f2的化简结果为:');
disp(f2_simple);
