clear;close all;clc
load('ecg_mitdb_rr.mat')

HRVparams=InitializeHRVparams('SeminarskiADS');
HRVparams.windowlength=300;
HRVparams.increment = 100;
rezultati=cell(N1+N2,1);
klase=cell(N1+N2,1);
HRVparams.Fs=Fs1;
for i=1:N1        
        [rezultati{i},fileName]=Main_HRV_Analysis(RR1{i}/Fs1,tm1{i}/Fs1,'RRIntervals',HRVparams,"arr"+num2str(i));
        klase{i}='ARR';
end
HRVparams.Fs=Fs2;
for i=N1+1:N1+N2        
        [rezultati{i},fileName]=Main_HRV_Analysis(RR2{i-N1}/Fs2,tm2{i-N1}/Fs2,'RRIntervals',HRVparams,"nsr"+num2str(i-N1));
        klase{i}='NSR';
end

N=0;
M=0;
for i=1:N1+N2
   if isnan(rezultati{i}(1,1))~=false
       N=N+1;
       rez{N}=rezultati{i};
       for j=1:size(rezultati{i},1)
           M=M+1;
           kls{M}=klase{i};
       end      
   end
end
klase=kls';
rezultati=cell2mat(rez');
N=M;
save('rezultati.mat','rezultati','klase','N')