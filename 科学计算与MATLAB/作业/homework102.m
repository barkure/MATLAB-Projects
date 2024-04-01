A=[12 34 -4;34 7 87;3 65 7];
B=[1 3 -1;2 0 3;3 -2 7];
I=eye(3,3); %定义一个3*3的单位矩阵
%2.1
M1=A+6*B;
M2=A-B+I;
%2.2
M3=A*B;
M4=A.*B;
%2.3
M5=A^3;
M6=A.^3;
%2.4
M7=A/B;
M8=A\B;
%2.5
M9=[A,B];
M10=[A([1,3], :);B^2];

%打印结果
num_matrices = 10;

% 使用循环批量打印每个矩阵
for k = 1:num_matrices
    matrix_name = sprintf('M%d', k);  % 构造矩阵的名称，如 M1, M2, ...
    
    % 使用eval函数获取当前矩阵的值
    currentMatrix = eval(matrix_name);
    
    fprintf('Matrix %s:\n', matrix_name);
    [m, n] = size(currentMatrix);
    for i = 1:m
        for j = 1:n
            fprintf('%d\t', currentMatrix(i, j));
        end
        fprintf('\n');  % 在每行的末尾添加换行符
    end
    fprintf('\n');  % 在矩阵之间添加额外的换行符
end