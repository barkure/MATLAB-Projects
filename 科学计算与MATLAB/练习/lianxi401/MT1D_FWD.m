function [rho_a, phase] = MT1D_FWD(rho, h)
% MT1D_FWD 函数用于计算MT（磁-电法）模型的电阻率 (rho_a) 和相位 (phase)。

% 物理常数
miu = (4e-7) * pi;

% 生成一组时间常数 T，共40个数值，用于频谱分析
T = logspace(-3, 4, 40);

% 初始化存储传导率的矩阵 k
k = zeros(size(rho, 2), size(T, 2));

% 计算每一层的传导率 k
for N = 1:size(rho, 2)
    k(N, :) = sqrt(-j * 2 * pi * miu ./ (T .* rho(N)));
end

% 层数
m = size(rho, 2);

% 初始化传输阻抗 Z
Z = -(j * miu * 2 * pi) ./ (T .* k(m, :));

% 逐层计算传输阻抗 Z
for n = m-1:-1:1
    A = -(j * miu * 2 * pi) ./ (T .* k(n, :));
    B = exp(-2 * k(n, :) * h(n));
    Z = A .* (A .* (1 - B) + Z .* (1 + B)) ./ (A .* (1 + B) + Z .* (1 - B));
end

% 计算电阻率 rho_a
rho_a = (T ./ (miu * 2 * pi)) .* (abs(Z).^2);

% 计算相位角 phase，转换为度数
phase = -atan(imag(Z) ./ real(Z)) * 180 / pi;
end
