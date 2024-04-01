n = 0; % 初始项数
e_jinsi = 1; % 初始化近似值
jiecheng = 1;

while 1 / jiecheng > 1e-5
    n = n + 1;
    jiecheng = jiecheng * n;
    e_jinsi = e_jinsi + 1 / jiecheng;
end

disp(['e 的近似值：', num2str(e_jinsi)]);
