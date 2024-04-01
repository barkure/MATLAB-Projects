function [rho_a, phase] = MT1D_FWD(rho, h)
% MT1D_FWD �������ڼ���MT����-�編��ģ�͵ĵ����� (rho_a) ����λ (phase)��

% ������
miu = (4e-7) * pi;

% ����һ��ʱ�䳣�� T����40����ֵ������Ƶ�׷���
T = logspace(-3, 4, 40);

% ��ʼ���洢�����ʵľ��� k
k = zeros(size(rho, 2), size(T, 2));

% ����ÿһ��Ĵ����� k
for N = 1:size(rho, 2)
    k(N, :) = sqrt(-j * 2 * pi * miu ./ (T .* rho(N)));
end

% ����
m = size(rho, 2);

% ��ʼ�������迹 Z
Z = -(j * miu * 2 * pi) ./ (T .* k(m, :));

% �����㴫���迹 Z
for n = m-1:-1:1
    A = -(j * miu * 2 * pi) ./ (T .* k(n, :));
    B = exp(-2 * k(n, :) * h(n));
    Z = A .* (A .* (1 - B) + Z .* (1 + B)) ./ (A .* (1 + B) + Z .* (1 - B));
end

% ��������� rho_a
rho_a = (T ./ (miu * 2 * pi)) .* (abs(Z).^2);

% ������λ�� phase��ת��Ϊ����
phase = -atan(imag(Z) ./ real(Z)) * 180 / pi;
end
