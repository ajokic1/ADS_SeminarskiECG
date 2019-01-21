clear
clc
close all


%%ucitavanje signala iz ARR baze
disp('Ucitavanje signala iz MIT-BIH ARR baze...')
M=108000;
signali=[100:109 111:119 121:124 200:203 205 207:210 212:215 217 219:223];
N=2*length(signali);
ecg1=cell(N,1);
klasa1=cell(N,1);
%ann=cell(N,1);
for i=1:2:N
    s=['mitdb/' int2str(signali((i+1)/2))];
    [sig,Fs1,tm1]=rdsamp(s,1,2*M);
    ecg1{i}=sig(1:M);
    ecg1{i+1}=sig(M+1:2*M);
%     ann{i,1}=rdann(s,'atr',1,2*M);
%     ann{i,1}=a(1:length(a)/2);
%     ann{i+1,1}=a(length(a)/2+1:length(a));
    klasa1{i}='ARR';
    klasa1{i+1}='ARR';
    disp(['ucitan ' int2str((i+1)/2) '. signal'])
end
N1=N;
M1=M;
%% ucitavanje signala iz nsr baze
disp('Ucitavanje signala iz MIT-BIH NSR baze...')
signali=[16265 16272 16273 16420 16483 16539 16773 16786 16795 17052 ...
17453 18177 18184 19088 19090 19093 19140 19830];

M=38400;
N=3*length(signali);
ecg2=cell(N,1);
klasa2=cell(N,1);
%ann=cell(N,1);
for i=1:3:N
    s=['nsrdb/' int2str(signali((i+2)/3))];
    [sig,Fs2,tm2]=rdsamp(s,1,2*M);
    ecg2{i}=sig(1:M);
    ecg2{i+1}=sig(M+1:2*M);
    ecg2{i+2}=sig(2*M+1:3*M);
%     ann{i,1}=rdann(s,'atr',1,2*M);
%     ann{i,1}=a(1:length(a)/2);
%     ann{i+1,1}=a(length(a)/2+1:length(a));
    klasa2{i}='ARR';
    klasa2{i+1}='ARR';
    klasa2{i+2}='ARR';
    disp(['ucitan ' int2str((i+2)/3) '. signal'])
end
N2=N;
M2=M;

%% spajanje i cuvanje
ecg={ecg1; ecg2};
klasa={klasa1; klasa2};
save('ecg_mitdb.mat','ecg','klasa','N1','M1','N2','M2','Fs1','Fs2',...
'tm1','tm2')

