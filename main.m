%
% ==== Obrada i klasifikacija EKG signala pomocu SVM klasifikatora ====
%
% Andrej Jokic
%

%% Ucitavanje signala
% ECGData.Data: Matrica dimenzija 162x65536
% ECGData.Labels: Matrica dimenzija 162x1 - klase EKG signala
% Svaki red predstavlja jedan EKG signal

uc_uzorkovanja=128; %ucestanost uzorkovanja 128 Hz
load('ECGData/ECGData.mat');

%% Obrada signala pomocu LMS algoritma za uklanjanje suma

%obradaLMS(ECGData.Data);

%% Izdvajanje parametara signala
% Parametri se izdvajaju pomocu paketa PhysioNet Cardiovascular Signal
% Toolbox.

HRVParams=InitializeHRVparams('SeminarskiADS');
