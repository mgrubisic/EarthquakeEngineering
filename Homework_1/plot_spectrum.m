% �����򣬻���Ӧ�ף���С�ڷֱ�����
%% ���ٶȷ�Ӧ��
clc;clear;
Tg=0.1:0.01:10;% Tg���ܴ�0��ʼ������������Ϊʲô��
dr1=0;dr2=0.01;dr3=0.02;dr4=0.05;dr5=0.1;
[umax1,vmax1,amax1]=Spectrum(dr1,Tg);
[umax2,vmax2,amax2]=Spectrum(dr2,Tg);
[umax3,vmax3,amax3]=Spectrum(dr3,Tg);
[umax4,vmax4,amax4]=Spectrum(dr4,Tg);
[umax5,vmax5,amax5]=Spectrum(dr5,Tg);
plot(Tg,amax1);
hold on
plot(Tg,amax2,'r');
plot(Tg,amax3,'g');
plot(Tg,amax4,'y');
plot(Tg,amax5,'k');
xlabel('��������Tg��s��');
ylabel('���ٶ�a��m/s^2��');
title('���ٶȷ�Ӧ��');
legend('�����0','�����0.01','�����0.02','�����0.05','�����0.1');
%% �ٶȷ�Ӧ��
clc;clear;
Tg=0.1:0.01:10;% Tg���ܴ�0��ʼ������������Ϊʲô��
dr1=0;dr2=0.01;dr3=0.02;dr4=0.05;dr5=0.1;
[umax1,vmax1,amax1]=Spectrum(dr1,Tg);
[umax2,vmax2,amax2]=Spectrum(dr2,Tg);
[umax3,vmax3,amax3]=Spectrum(dr3,Tg);
[umax4,vmax4,amax4]=Spectrum(dr4,Tg);
[umax5,vmax5,amax5]=Spectrum(dr5,Tg);
plot(Tg,vmax1);
hold on
plot(Tg,vmax2,'r');
plot(Tg,vmax3,'g');
plot(Tg,vmax4,'y');
plot(Tg,vmax5,'k');
xlabel('��������Tg��s��');
ylabel('�ٶ�v��m/s��');
title('�ٶȷ�Ӧ��');
legend('�����0','�����0.01','�����0.02','�����0.05','�����0.1');
%% λ�Ʒ�Ӧ��
clc;clear;
Tg=0.1:0.01:10;% Tg���ܴ�0��ʼ������������Ϊʲô��
dr1=0;dr2=0.01;dr3=0.02;dr4=0.05;dr5=0.1;
[umax1,vmax1,amax1]=Spectrum(dr1,Tg);
[umax2,vmax2,amax2]=Spectrum(dr2,Tg);
[umax3,vmax3,amax3]=Spectrum(dr3,Tg);
[umax4,vmax4,amax4]=Spectrum(dr4,Tg);
[umax5,vmax5,amax5]=Spectrum(dr5,Tg);
plot(Tg,umax1);
hold on
plot(Tg,umax2,'r');
plot(Tg,umax3,'g');
plot(Tg,umax4,'y');
plot(Tg,umax5,'k');
xlabel('��������Tg��s��');
ylabel('λ��u��m��');
title('λ�Ʒ�Ӧ��');
legend('�����0','�����0.01','�����0.02','�����0.05','�����0.1');