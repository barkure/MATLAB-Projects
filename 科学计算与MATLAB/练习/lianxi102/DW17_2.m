function y = DW17_1(n)
    y = 1;
    i = 0;

    while i <= n
        i = i+1;
        y = y * ((2 * i)^2) / ((2 * i - 1) * (2 * i + 1));
    end
    
end
