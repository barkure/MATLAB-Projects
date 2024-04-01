function y = DW17_3(n)
    y = prod((2 .* (1:n)).^2 ./ ((2 .* (1:n) - 1) .* (2 .* (1:n) + 1)));
end
