function f = ricker(f0,t,t0)
% f0: 主频率
%  t:  采样时间
% t0: 延迟时间
f =(1-(2*((pi)^2)*(f0^2)*(t-t0)^2))*(exp(-((pi)^2)*(f0^2)*( t-t0)^2)) ;
