clear
clc
close all

%load('C:\Users\kokik\Documents\ADS\Seminarski EKG\MLII\1 NSR\100m (0).mat')

disp('Ucitavanje signala iz MIT-BIH baze...')
[~,config]=wfdbloadlib;
M=10000;
[ecg,Fs,tm]=rdsamp('mitdb/100',1,M);

a=0.1*randn(1,length(ecg)); %sum
b=(ecg'+a); %signal+sum

x=a';
d=b';

%M=length(x);

N  = 1;  
mi=0.32;
%mi0 = 1; %korak
H  = zeros(N, 1);
Hm = zeros(N, M);
y  = zeros(M, 1);
e  = zeros(M, 1);
disp('LMS algoritam...')
for   n = N:M
    Hm(:,n) = H;
    X = x(n:-1:n-(N-1));
    
%     if n>700
%         mi0=0.05;
%     elseif n>200
%         mi0=0.2;
%     end
%     mi = mi0/(1 + X'*X);

    y(n) = H'*X; 
    e(n) = d(n) - y(n);
    H = H + mi*e(n)*X;
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


figure
t=1:M;
plot(t,Hm)

