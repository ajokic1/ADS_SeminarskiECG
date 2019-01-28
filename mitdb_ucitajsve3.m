%ova verzija ucitava 2x i 3x duzine, ali sve u jedan vektor
clear
clc
close all


%%ucitavanje signala iz ARR baze
disp('Ucitavanje signala iz MIT-BIH ARR baze...')
M=2*108000;
signali=[100:109 111:119 121:124 200:203 205 207:210 212:215 217 219:223];
N=length(signali);
ecg1=cell(N,1);
klasa1=cell(N,1);
RR1=cell(N,1);
for i=1:N
    s=['mitdb/' int2str(signali(i))];
    [ecg1{i},Fs1,tm1]=rdsamp(s,1,M);
    [RR1{i},tms1{i}]=ann2rr(s,'atr',M);
    klasa1{i}='ARR';
    disp(['ucitan arr' int2str(i)])
end
N1=N;
M1=M;
%% ucitavanje signala iz nsr baze
disp('Ucitavanje signala iz MIT-BIH NSR baze...')
signali=[16265 16272 16273 16420 16483 16539 16773 16786 16795 17052 ...
17453 18177 18184 19088 19090 19093 19140 19830];

M=3*38400;
N=length(signali);
ecg2=cell(N,1);
klasa2=cell(N,1);
RR2=cell(N,1);
for i=1:N
    s=['nsrdb/' int2str(signali(i))];
    [ecg2{i},Fs2,tm2]=rdsamp(s,1,M);
    [RR2{i},tms2]=ann2rr(s,'atr',M);
    klasa2{i}='NSR';
    disp(['ucitan nsr' int2str(i)])
end
N2=N;
M2=M;

%% spajanje i cuvanje
ecg={ecg1; ecg2};
klasa={klasa1; klasa2};
save('ecg_mitdb.mat','ecg','klasa','N1','M1','N2','M2','Fs1','Fs2',...
'tm1','tm2','RR1','RR2','tms1','tms2')

