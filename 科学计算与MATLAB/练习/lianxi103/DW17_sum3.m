function y = DW17_sum3(x, n)
    y = sum((-1).^(0:n) .* (x.^(2*(0:n))) ./ factorial(2*(0:n)));
end
