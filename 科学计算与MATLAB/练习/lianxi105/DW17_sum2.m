function y = DW17_sum1(n)
    y = 0;
    i = 0;

    while i < n
        i = i+1;
        y = y+(-1)^(i-1) / ((2*i) - 1);
    end
    y = 4*y;
end
