function [a,t,Sx,w]=CloughPenzien(wg,dg,t1,t2,c)
% ���룺
% ��������Ƶ��wg
% ���������dg (ground damping ratio)
% ǿ�Ȱ��纯�����������
% t1,t2:����ƽ�ȶε���ĩʱ��
% c��һ�����ڼ���g�ľ��������
% �����
% ������ٶ�ʱ��a
% ����ϵͳ���� filter
wf=0.1*wg;
df=dg;
dw=0.2;
w=0:dw:99.8;
N=length(w);
phi=rand(N,1)*2*pi;% ��λ��Ϊ0-2��pi֮����ȷֲ����������
t=0:0.01:40; % ���𲨳���40s
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
% ����Clough-Penzienģ��
temp1=(wg^4+4*dg^2*wg^2*w^2)/((wg^2-w^2)^2+4*dg^2*wg^2*w^2);
temp2=(w^4)/((wf^2-w^2)^2+4*df^2*wf^2*w^2);
S0=SpectralIntensityFactor();
Sx=temp1*temp2*S0;

end

function S0=SpectralIntensityFactor()
    %��ǿ������
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