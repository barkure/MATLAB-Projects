function y = DW17_sum2(x,n)
    y = 1;
    i = 0;
    while i < n
        i = i+1;
        y = y + ((-1)^i) * (x^(2*i)) / factorial(2*i);
    end
end
