function y = DW17_sum1(n)
    y = 0;
    
    for i = 1:n
        y = y+(-1)^(i-1) / ((2*i) - 1);
    end
    y = 4*y;
end
