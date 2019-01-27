clear all
clc
close all

load('C:\Users\kokik\Documents\ADS\Seminarski EKG\100m (0).mat')
val=double(val)/1000;
a=0.01*randn(1,length(val));
b=(val+a);

x=a;
d=b;

M=length(x);
N=5;
H=zeros(N,1);
%mi=1;
mi1=0.000004;
e=zeros(1,M);
mii=zeros(1,M);
for i=1:M
    if i >= N
        X = x(i:-1:i-(N-1)).'; % ako je n >= N onda stari metod
    else
        X = zeros(N, 1); % ako je n < N pravimo ovo rjesenje za prvih N kako bi izbjegli gresku 
        X(1:i) = x(i:-1:1);        
    end
    y=H.'*X;
    e(i)=d(i)-y;
    mi=mi1/(0.0000001+X.'*X);
    mii(i)=mi;
    H=H+mi*e(i)*X;
end
%figure(2)
%semilogy(abs(e));
H

% figure(1)
% subplot(3,1,1)
% plot(val)
% title('original')
% ylim([0.9 1.3])
% 
% subplot(3,1,2)
subplot(2,1,1)
plot(b)
title('zasumljen')
ylim([0.9 1.3])

% subplot(3,1,3)
subplot(2,1,2)
t=1:M;
plot(t,e,t,val)

title('filtriran')
ylim([0.9 1.3])
% 
 figure
 plot(mii)