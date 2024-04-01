function y = DW17_1(n)
    y = 1;
    
    for i = 1:n
        y = y * ((2 * i)^2) / ((2 * i - 1) * (2 * i + 1));
    end
end
