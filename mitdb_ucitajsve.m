clear
clc
close all


%%ucitavanje signala iz ARR baze
disp('Ucitavanje signala iz MIT-BIH baze...')
M=108000;
signali=[100:109 111:119 121:124 200:203 205 207:210 212:215 217 219:223];
N=length(signali);
ecg=zeros(N,M);
klasa=cell(N,1);
ann=cell(N,1);
for i=1:N
    s=['mitdb/' int2str(signali(i))];
    [ecg(i,:),Fs,tm]=rdsamp(s,1,M);
    ann{i,1}=rdann(s,'atr',1,M);
    klasa(i,1)={'ARR'};
    disp(['ucitan ' int2str(i) '. signal'])
end
Fs_arr=Fs;
tm_arr=tm;

%% ucitavanje signala iz nsr baze
signali=[16265 16272 16273 16420 16483 16539 16773 16786 16795 17052 ...
17453 18177 18184 19088 19090 19093 19140 19830];

M1=108000;
N1=N;

M=38400;
N=length(signali);
ecg=[ecg; zeros(N,M1)];
klasa=[klasa; cell(N,1)];
ann=[ann; cell(N,1)];
for i=N1:N+N1
    s=['nsrdb/' int2str(signali(i-N1+1))];
    [ecg(i,1:M),Fs,tm]=rdsamp(s,1,M);
    ann{i,1}=rdann(s,'atr',1,M);
    klasa(i,1)={'ARR'};
    disp(['ucitan nsr' int2str(i) '. signal'])
end
Fs_nsr=Fs;
tm_nsr=tm;
