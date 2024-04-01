function result = S(n)

    S = 0; % 初始化 S 的值为 0

    for i = 1:n
        a = sum(1:i);

        % 累加到 S 中
        S = S + a;
    end

    result = S;
end
