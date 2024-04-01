% 声明符号变量 x
syms x;

% （1）小题
f1 = (x*(exp(sin(x))+1)-2*(exp(tan(x))-1))/(sin(x)^3);
f1_result = limit(f1,x,0);
disp('第一小题：');
disp('极限是：');
disp(f1_result);

% （2）小题
f2 = (sqrt(x)-sqrt(acos(x))/sqrt(x+1));
f2_result = limit(f2,x,-1,'right');
disp('第二小题：');
disp('极限是：');
disp(f2_result);

% （3）小题
y = (1-cos(2*x))/x;
dy_dx = diff(y,x);
d2y_dx2 = diff(y,x,2);
disp('第三小题：');
disp('y’=');
disp(dy_dx);
disp('y’’=');
disp(d2y_dx2);

% （4）第四小题
% 声明符号变量 t a
syms t a;

A = [a^x t^3;t*cos(x) log(x)];
dA_dx = diff(A,x);
d2A_dt2 = diff(A,t,2);
d2A_dxdt = diff(diff(A,x),t);
disp('第四小题：');
disp('dA/dx=');
disp(dA_dx);
disp('d2A_dt2=');
disp(d2A_dt2);
disp('d2A_dxdt=');
disp(d2A_dxdt);

clear;

% （5）第五小题
% 声明符号变量 x y
syms x y;

f = (x^2-2*x)*exp(-x^2-y^2-x*y);
df_dx = diff(f,x);
d2f_dxdy = diff(df_dx,y);
result = subs(d2f_dxdy,[x,y],[0,1]);
% 打印结果
disp('第五小题：');
disp('∂f/∂x=');
disp(df_dx);
disp('∂²f/∂x∂y=');
disp(result);

