clear
clc
close all

disp('Ucitavanje signala iz MIT-BIH baze...')
[~,config]=wfdbloadlib;
M=108000;
[ecg,Fs,tm]=rdsamp('mitdb/100',1,M);
ann=rdann('mitdb/100','atr',1,M);

%plot(tm,ecg)
%hold on
%plot(tm(ann), ecg(ann),'ro')

%physionet toolkit
HRVparams=InitializeHRVparams('SeminarskiADS');
HRVparams.Fs=Fs;
HRVparams.windowlength=300;

[rezultati,fileName]=Main_HRV_Analysis(ecg,'','ECGWaveform',HRVparams);

