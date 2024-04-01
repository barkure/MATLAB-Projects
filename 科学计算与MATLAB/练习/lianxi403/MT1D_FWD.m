function [rho_a,phase]=MT1D_FWD(rho,h) %输入参数rho为各层电阻率，h为厚度
mu=(4e-7)*pi;
T=logspace(-3,4,40);
k=zeros(size(rho,2),size(T,2));
for N=1:size(rho,2);
    k(N,:)=sqrt(-j*2*pi*mu./(T.*rho(N)));
end
m=size(rho,2);
Z=-(j*mu*2*pi)./(T.*k(m,:));
for n=m-1:-1:1;
    A=-(j*mu*2*pi)./(T.*k(n,:));
    B=exp(-2*k(n,:)*h(n));
    Z=A.*(A.*(1-B)+Z.*(1+B))./(A.*(1+B)+Z.*(1-B));
end
rho_a=(T./(mu*2*pi).*(abs(Z).^2));
phase=-atan(imag(Z)./real(Z)).*180/pi;4-1

end