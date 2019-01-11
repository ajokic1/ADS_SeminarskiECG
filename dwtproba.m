clear all
close all
clc

load ('primjer.mat')
[wA,wD]=dwt(val, 'coif1');
[wA2,wD2]=dwt(wA, 'coif1');
[wA3,wD3]=dwt(wA2, 'coif1');
subplot(3,2,1)
plot(val)
title('original')

subplot(3,2,2)
plot(wD)
title('lv1 det')

subplot(3,2,3)
plot(wD2)
title('lv2 det')

subplot(3,2,4)
plot(wA3)
title('lv3 apr')

subplot(3,2,5)
plot(wD3)
title('lv3 det')