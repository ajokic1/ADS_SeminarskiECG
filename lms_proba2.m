clear all
clc
close all

load('C:\Users\kokik\Documents\ADS\Seminarski EKG\MLII\1 NSR\100m (0).mat')
val=double(val)/1000; %originalni signal
a=0.01*randn(1,length(val)); %sum
b=(val+a); %signal+sum

x=a';
d=b';

M=length(x);

N  = 2;  
mi=1.4;
%mi0 = 0.002; %korak
H  = zeros(N, 1);
Hm = zeros(N, M);
y  = zeros(M, 1);
e  = zeros(M, 1);
mii=zeros(1,M);
for   n = N:M
    Hm(:,n) = H;
    X = x(n:-1:n-(N-1));
    mi=0.95*2/(5*(0.001+var(X)));
    %mi = mi0/(0.001 + X'*X); % malo lambda 
    y(n) = H'*X; 
    e(n) = d(n) - y(n);
    H = H + mi/(0.001+X'*X )*e(n)*X;
    mii(n)=mi;
end


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

figure
plot(mii)

figure
t=1:M;
plot(t,Hm)

