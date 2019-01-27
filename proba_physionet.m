clear all
close all
clc

uc_uzorkovanja=128; %ucestanost uzorkovanja 128 Hz
load('ECGData/ECGData.mat');

HRVparams=InitializeHRVparams('SeminarskiADS');
HRVparams.Fs=uc_uzorkovanja;
HRVparams.windowlength=512;

[rezultati,fileName]=Main_HRV_Analysis(ECGData.Data(1,:),'','ECGWaveform',HRVparams);

% Iz rezultata uzimamo sljedece parametre:
%   Time domain:        RR mean, RR Std, HR mean, HR Std, RMSSD, NN50, 
%                       pNN50, RR Triangular Index, TINN.
%   Frequency domain:   VLFpwr, LFpwr, HFpwer, LFnorm, HFnorm
%                       LF/HF Ratio
ind_parametara=[2:13 15:20];
parametri=rezultati(ind_parametara);