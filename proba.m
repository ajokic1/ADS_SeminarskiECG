clear all
clc
close all

load('C:\Users\kokik\Documents\ADS\Seminarski EKG\MLII\1 NSR\100m (0).mat')
val=double(val)/1000;
a=0.02*randn(1,length(val));
b=(val+a);
c=lms_p1(b,a);

figure(1)
subplot(3,1,1)
plot(val)
title('original')
ylim([0.9 1.3])

subplot(3,1,2)
plot(b)
title('zasumljen')
ylim([0.9 1.3])

subplot(3,1,3)
plot(c)
title('filtriran')
ylim([0.9 1.3])
