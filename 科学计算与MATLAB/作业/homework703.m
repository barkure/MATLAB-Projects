% 定义系数矩阵 A 和右侧向量 b
A = [6 5 -2 5;9 -1 4 -1;3 4 2 -2;3 -9 0 2];
b = [-4;13;1;11];

% 法一 LU分解
[L,U] = lu(A);
x_lu = U\(L\b)

% 法二 QR分解
[Q,R] = qr(A);
x_qr = R\(Q\b)

% 法三 SVD分解
% 使用SVD分解计算伪逆矩阵
[U, S, V] = svd(A);
A_pseudo_inv = V * inv(S) * U';

x_svd = A_pseudo_inv * b