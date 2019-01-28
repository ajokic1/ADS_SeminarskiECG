clear
clc
close all
disp('Ucitavanje signala iz MIT-BIH baze...')
M=216000;
signali=[100:109 111:119 121:124 200:203 205 207:210 212:215 217 219:223];
N=length(signali);

RR1=cell(N,1);
tm1=cell(N,1);
for i=1:N
    s=['mitdb/' int2str(signali(i))];
    [RR1{i},tm1{i}]=ann2rr(s,'atr',M);
end
N1=N;
Fs1=360;


signali=[16265 16272 16273 16420 16483 16539 16773 16786 16795 17052 ...
17453 18177 18184 19088 19090 19093 19140 19830];
N=length(signali);
M=115200;

RR2=cell(N,1);
tm2=cell(N,1);
for i=1:N
    s=['nsrdb/' int2str(signali(i))];
    [RR2{i},tm2{i}]=ann2rr(s,'atr',M);
end
N2=N;
Fs2=128;

save('ecg_mitdb_rr.mat','RR1','tm1','N1','Fs1','RR2','tm2','N2','Fs2');