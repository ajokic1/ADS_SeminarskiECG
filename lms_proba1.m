clear all
clc
close all

%load('C:\Users\kokik\Documents\ADS\Seminarski EKG\MLII\1 NSR\100m (0).mat')

disp('Ucitavanje signala iz MIT-BIH baze')
[~,config]=wfdbloadlib;
M=10000;
[ecg,Fs,tm]=rdsamp('mitdb/100',1,M);
a=0.1*randn(1,length(ecg)); %sum
b=(ecg'+a); %signal+sum

x=a';
d=b';

%M=length(x);

N  = 2;  
%mi=0.12;
mi0 = 0.15; %korak
H  = zeros(N, 1);
Hm = zeros(N, M);
y  = zeros(M, 1);
e  = zeros(M, 1);
mii=zeros(1,M);
disp('LMS algoritam')
for   n = N:M
    Hm(:,n) = H;
    X = x(n:-1:n-(N-1));
    mi = mi0/(1 + X'*X); % malo lambda 
%       if n>500
%           mi=0.0000005;
%       elseif n>100
%           mi=0.0000002;
%       end
    y(n) = H'*X; 
    e(n) = d(n) - y(n);
    H = H + mi*e(n)*X;
    mii(n)=mi;
end


figure
subplot(2,1,1)
plot(b)
title('zasumljen')
%ylim([900 1300])

% subplot(3,1,3)
subplot(2,1,2)
t=1:M;
plot(t,e,t,ecg)

title('filtriran')
%ylim([900 1300])

% figure
% plot(mii)

figure
t=1:M;
plot(t,Hm)

