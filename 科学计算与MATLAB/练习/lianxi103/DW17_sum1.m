function y = DW17_sum1(x, n)
    y = 1;
    
    for i = 1:n
        y = y + ((-1)^i) * (x^(2*i)) / factorial(2*i);
    end
end
