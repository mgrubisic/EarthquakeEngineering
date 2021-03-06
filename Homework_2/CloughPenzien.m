function [a,t,Sx,w]=CloughPenzien(wg,dg,t1,t2,c)
% 输入：
% 场地特征频率wg
% 场地阻尼比dg (ground damping ratio)
% 强度包络函数计算参数：
% t1,t2:主振平稳段的首末时间
% c：一个用于计算g的经验参数？
% 输出：
% 地震加速度时程a
% 过滤系统参数 filter
wf=0.1*wg;
df=dg;
dw=0.2;
w=0:dw:99.8;
N=length(w);
phi=rand(N,1)*2*pi;% 相位角为0-2×pi之间均匀分布的随机变量
t=0:0.01:40; % 地震波持续40s
nt=length(t);
a=zeros(nt,1);
Sx=zeros(N,1);
for k=1:N
    Sx(k)=PowerSpectralDensity(w(k),wg,dg,wf,df);
end
for i=1:nt
    g=TimeIntensityFunction(t1,t2,c,t(i));
    for j=1:N
        S=g^2*Sx(j);
        A=sqrt(4*S*dw);
        a(i)=a(i)+A*cos(w(j)*t(i)-phi(j));
    end
end
end

function Sx=PowerSpectralDensity(w,wg,dg,wf,df)
% 根据Clough-Penzien模型
temp1=(wg^4+4*dg^2*wg^2*w^2)/((wg^2-w^2)^2+4*dg^2*wg^2*w^2);
temp2=(w^4)/((wf^2-w^2)^2+4*df^2*wf^2*w^2);
S0=SpectralIntensityFactor();
Sx=temp1*temp2*S0;

end

function S0=SpectralIntensityFactor()
    %谱强度因子
    S0=3;
end

function g=TimeIntensityFunction(t1,t2,c,t)
if (t<=t1)
    g=(t/t1)^2;
else if (t<=t2)
        g=1;
    else
        g=exp(-c*(t-t2));
    end
end
end