%% ucitavanje signala
clear;close all;clc

load('ecg_1.mat');      %ecg, Fs, M

x=0.2*randn(1,M);       %samo sum
d=x+ecg';               %signal+sum

%% lms algoritam
N=1;
mi=0.15;
H  = zeros(N, 1);
y  = zeros(1, M);
e  = zeros(1, M);
for n=N:M
    X = x(n:-1:n-(N-1));
    y(n) = H'*X; 
    e(n) = d(n) - y(n);
    H = H + mi*e(n)*X; 
end

subplot(3,1,1); plot(e);axis([0 2000 -1 2])
ylabel('Amplituda [mV]')
xticks(0:500:2000); ax=gca; ax.FontSize=8;
title('LMS \mu=0.15','fontsize',10); 


%% nlms algoritam
N=1;
mi0=0.15;
H  = zeros(N, 1);
y  = zeros(1, M);
e  = zeros(1, M);
for n=N:M
    X = x(n:-1:n-(N-1));
    mi = mi0/(1 + X'*X);
    y(n) = H'*X; 
    e(n) = d(n) - y(n);
    H = H + mi*e(n)*X; 
end

subplot(3,1,2); plot(e);axis([0 2000 -1 2])
ylabel('Amplituda [mV]')
xticks(0:500:2000); ax=gca; ax.FontSize=8;
title('NLMS \mu_{0}=0.15','fontsize',10); 


%% varijabilni nlms algoritam
N=1;
mi0=1;
H  = zeros(N, 1);
y  = zeros(1, M);
e  = zeros(1, M);
for n=N:M
    X = x(n:-1:n-(N-1));
    
    if n>700
        mi0=0.05;
    elseif n>200
        mi0=0.10;
    end
    mi = mi0/(1 + X'*X);

    y(n) = H'*X; 
    e(n) = d(n) - y(n);
    H = H + mi*e(n)*X; 
end

subplot(3,1,3); plot(e);axis([0 2000 -1 2])
ylabel('Amplituda [mV]')
xticks(0:500:2000); ax=gca; ax.FontSize=8;
title('Varijabilni NLMS \mu_{0}=1','fontsize',10); 

% %% cuvanje grafika
% fig = gcf;
% fig.PaperPositionMode = 'auto';
% fig_pos = fig.PaperPosition;
% fig.PaperSize = [fig_pos(3) fig_pos(4)];
% print (fig,'rad/lmsgrafik_por.pdf','-dpdf')
